import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zihnai/ultils/providers/user_provider.dart';
import 'package:zihnai/screens/home.dart';
import 'package:zihnai/screens/onboarding/name_onboarding.dart';
import 'package:zihnai/screens/onboarding/onboarding_home.dart';
import 'package:zihnai/screens/onboarding/reminder_onboarding.dart';
import 'package:zihnai/ultils/services/notification_service.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int step = 0;
  void goToNextStep() {
    setState(() {
      step += 1;
    });
  }

  void goToPreviousStep() {
    setState(() {
      step -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> onDone() async {
      final String userName = context.read<UserProvider>().name;
      final bool userNotification = context.read<UserProvider>().notification;
      final bool userReminder = context.read<UserProvider>().reminder;
      final int userReminderHours = context.read<UserProvider>().reminderHours;
      final int userReminderMinutes =
          context.read<UserProvider>().reminderMinutes;
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
      if (userNotification) {
        NotificationService().requestNotificationPermission();
      } // bg fetch islemi
      if (userReminder) {
        NotificationService().requestNotificationPermission();
        NotificationService().scheduleDailyNotification(
          userReminderHours,
          userReminderMinutes,
          'Ready to Talk? 😊',
          'It`s time to chat with your AI psychologist! Share your feelings and relax. 🌸',
        );
      }

      //shut down onboarding
      await prefs.setBool('showHome', true);

      // go home

      if (context.mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Home()),
        );
      }
    }

    if (step == 0) {
      return OnboardingHome(
        onNext: goToNextStep,
      );
    }
    if (step == 1) {
      return NameOnboarding(
        onNext: goToNextStep,
        onBack: goToPreviousStep,
      );
    }
    // if (step == 2) {
    //   return NotificationsOnboarding(
    //     onNext: goToNextStep,
    //     onBack: goToPreviousStep,
    //   );
    // }
    else {
      return ReminderOnboarding(
        onNext: onDone,
        onBack: goToPreviousStep,
      );
    }
  }
}
