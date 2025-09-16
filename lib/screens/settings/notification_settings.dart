import 'dart:convert';
import 'dart:io';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';
import 'package:zihnai/generated/l10n.dart';
import 'package:zihnai/ultils/constant/color.dart';
import 'package:zihnai/ultils/enums/subscription_status_enum.dart';
import 'package:zihnai/ultils/functions/show_snackbar.dart';
import 'package:zihnai/ultils/providers/user_provider.dart';
import 'package:zihnai/ultils/services/notification_service.dart';
import 'package:zihnai/widgets/arrow_forward_button.dart';
import 'package:zihnai/widgets/wheel_time_picker.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  void setHours(int hours) {
    context.read<UserProvider>().setReminderHours(hours);
  }

  void setMinutes(int minutes) {
    context.read<UserProvider>().setReminderMinutes(minutes);
  }

  void setNotification(bool notificationIsEnabled) {
    context.read<UserProvider>().setNotification(notificationIsEnabled);
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    final reminderNotificationTitle = S.of(context).reminderNotificationTitle;
    final reminderNotificationBody = S.of(context).reminderNotificationBody;

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

      if (userReminder || userNotification) {
        NotificationService().requestNotificationPermission();
      }

      if (userNotification) {
        Workmanager().registerPeriodicTask(
          'id_unique', // Görev ID'si, benzersiz olmalı
          'affirmationNotification', // Görev adı
          tag: "affirmationNotification",
          frequency: Duration(hours: 4),
          // constraints: Constraints(networkType: NetworkType.connected),
        );
      } else {
        Workmanager().cancelByTag("affirmationNotification");
      }
      if (userReminder) {
        NotificationService().scheduleDailyNotification(
          userReminderHours,
          userReminderMinutes,
          reminderNotificationTitle,
          reminderNotificationBody,
        );
      } else {
        NotificationService().cancelScheduledNotification();
      }
      if (!context.mounted) return;

      Navigator.pop(context);
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor(dark),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: HexColor(white)), // Geri butonu
            onPressed: onDone,
          ),
        ),
        backgroundColor: HexColor(dark),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).motivationalNotificationTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    S.of(context).motivationalNotificationSubtitle,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
                // Switchable Button
                Container(
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: HexColor(secondary), // Arka plan rengi
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SwitchListTile(
                    value: context.watch<UserProvider>().notification,
                    onChanged: (value) async {
                      if (context.read<UserProvider>().userSubscriptionStatus ==
                          SubscriptionStatus.basic) {
                        showSnackbar(
                          context,
                          HexColor(primary),
                          S.of(context).bePremiumSnackbarTitle,
                          S.of(context).bePremiumSnackbarMessage,
                        );

                        return;
                      }

                      setNotification(value);
                    },
                    title: Text(
                      S.of(context).motivationalNotificationButtonTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    activeColor: HexColor(primary),
                    inactiveThumbColor: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                // REMINDER SETTINGS
                Text(
                  S.of(context).onboardingReminderTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    S.of(context).onboardingReminderSubtitle,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),

                // Switchable Button (SwitchListTile)
                Container(
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: HexColor(secondary),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SwitchListTile(
                    title: Text(
                      S.of(context).reminderButtonTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: context.watch<UserProvider>().reminder,
                    onChanged: (bool value) {
                      context.read<UserProvider>().setReminder(value);
                    },
                    activeColor: HexColor(primary),
                    inactiveThumbColor: Colors.grey,
                  ),
                ),
                // Time Picker
                if (context.watch<UserProvider>().reminder) ...[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      S.of(context).timePickerDescription,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  Center(
                    child: WheelTimePicker(
                      setHours: setHours,
                      setMinutes: setMinutes,
                      initialHours: context.watch<UserProvider>().reminderHours,
                      initialMinutes:
                          context.watch<UserProvider>().reminderMinutes,
                    ),
                  ),
                ],
                Platform.isAndroid
                    ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          S.of(context).batteryOptimization,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            S.of(context).batteryOptimizationBody,
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ),
                        ArrowForwardButton(
                          title: S.of(context).batteryOptimization,
                          onTap:
                              () => AppSettings.openAppSettings(
                                type: AppSettingsType.batteryOptimization,
                              ),
                        ),
                      ],
                    )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
