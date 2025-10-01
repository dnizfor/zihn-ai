import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

class NotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initializeNotifications() async {
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('notification');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );

    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsDarwin,
        );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> requestNotificationPermission() async {
    if (Platform.isAndroid) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.requestNotificationsPermission();
    } else if (Platform.isIOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);
    }
  }

  Future<void> showNotification(String title, String body) async {
    Random random = Random();
    int randomNumber = random.nextInt(100);
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          'zihn',
          'zihn',
          channelDescription: 'ai notification channel',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
        );
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.show(
      randomNumber,
      title,
      body,
      notificationDetails,
      payload: 'item x',
    );
  }

  Future<void> scheduleDailyNotification(
    int hours,
    int minutes,
    String title,
    String body,
  ) async {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hours,
      minutes,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'reminder',
          'reminder',
          channelDescription: 'therapy reminder',
          playSound: true,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> cancelScheduledNotification() async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }
}

// Daily scheduled notifications are divided into two categories:  

// 1. **Reminder Notifications:**
// These are therapy session reminders sent every 24 hours at the time specified by the user. 
//All of these notifications will have an `id` value of **0**.  

// 2. **Affirmation Message Notifications:** 
//These are notifications sent at specific times of the day. 
//They are triggered in the background using **"show notifications"**, and their `id` values are assigned at the last moment. 
//These notifications will have an `id` value **other than 0**.




// Günlük olarak planlanan bildirimler iki kategoriye ayrılır:  

// 1. **Hatırlatıcı (Reminder) Bildirimleri:** 
//Kullanıcının belirlediği saatte, 24 saatte bir gönderilen terapi saati hatırlatma bildirimleridir. 
//Bu bildirimlerin tamamının `id` değeri **0** olacaktır.  

// 2. **Olumlama Mesajı Bildirimleri:** 
//Günün belirli saatlerinde gönderilen bildirimlerdir. 
//Arka planda **"show notifications"** ile tetiklenir ve `id` değerleri son anda belirlenir. 
//Bu bildirimlerin `id` değeri **0 dışında bir değer** olacaktır.