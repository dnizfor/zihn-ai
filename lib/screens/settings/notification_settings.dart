import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zihnai/ultils/constant/color.dart';
import 'package:zihnai/ultils/providers/user_provider.dart';
import 'package:zihnai/ultils/services/notification_service.dart';
import 'package:zihnai/widgets/wheel_time_picker.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  bool notificationIsEnabled = false;
  void setHours(int hours) {
    context.read<UserProvider>().setReminderHours(hours);
  }

  void setMinutes(int minutes) {
    context.read<UserProvider>().setReminderMinutes(
          minutes,
        );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    Future<void> onDone() async {
      String userName = userProvider.name;
      bool userNotification = userProvider.notification;
      bool userReminder = userProvider.reminder;
      int userReminderHours = userProvider.reminderHours;
      int userReminderMinutes = userProvider.reminderMinutes;
      // save data as json
      Map<String, dynamic> userDataMap = {
        'name': userName,
        'notification': userNotification,
        'reminder': userReminder,
        'reminderHours': userReminderHours,
        'reminderMinutes': userReminderMinutes,
      };
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', jsonEncode(userDataMap));

      // request notification
      // if (userNotification) {
      //   NotificationService().requestNotificationPermission();
      // } // bg fetch islemi
      if (userReminder) {
        NotificationService().requestNotificationPermission();
        NotificationService().scheduleDailyNotification(
          userReminderHours,
          userReminderMinutes,
          'Ready to Talk? 😊',
          'It`s time to chat with your AI psychologist! Share your feelings and relax. 🌸',
        );
      } else {
        NotificationService().cancelScheduledNotification();
      }
      if (!context.mounted) return;

      Navigator.pop(context);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor(dark),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: HexColor(white),
              ), // Geri butonu
              onPressed: onDone,
            ),
          ),
          backgroundColor: HexColor(dark),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   'Affirmation Notification',
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 24,
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 20),
                  //   child: Text(
                  //     'Enable notifications for regular motivational notifications.',
                  //     style: TextStyle(
                  //       color: Colors.grey,
                  //       fontSize: 16,
                  //     ),
                  //   ),
                  // ),
                  // // Switchable Button
                  // Container(
                  //   height: 100,
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //     color: HexColor(secondary), // Arka plan rengi
                  //     borderRadius: BorderRadius.circular(12),
                  //   ),
                  //   child: SwitchListTile(
                  //     value: notificationIsEnabled,
                  //     onChanged: (bool value) {
                  //       setState(() {
                  //         notificationIsEnabled = value;
                  //       });
                  //     },
                  //     title: Text(
                  //       'Enable Notifications',
                  //       style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 15,
                  //           fontWeight: FontWeight.bold),
                  //     ),
                  //     activeColor: Colors.blue,
                  //     inactiveThumbColor: Colors.grey,
                  //     inactiveTrackColor: Colors.grey[600],
                  //   ),
                  // ),
                  // SizedBox(height: 20),
                  // REMINDER SETTINGS

                  Text(
                    'Set Therapy Reminder',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'In order not to disrupt the daily therapy process, we will send you a reminder half an hour before the time you set.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  // Switchable Button (SwitchListTile)
                  Container(
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: HexColor(secondary),
                        borderRadius: BorderRadius.circular(12)),
                    child: SwitchListTile(
                      title: Text(
                        'Enable Therapy Reminder',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      value: context.watch<UserProvider>().reminder,
                      onChanged: (bool value) {
                        context.read<UserProvider>().setReminder(value);
                      },
                      activeColor: Colors.blue,
                      inactiveThumbColor: Colors.grey,
                    ),
                  ),

                  // Time Picker
                  if (context.watch<UserProvider>().reminder) ...[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Schedule a meeting with your AI therapist.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Center(
                      child: WheelTimePicker(
                        setHours: setHours,
                        setMinutes: setMinutes,
                        initialHours:
                            context.watch<UserProvider>().reminderHours,
                        initialMinutes:
                            context.watch<UserProvider>().reminderMinutes,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
