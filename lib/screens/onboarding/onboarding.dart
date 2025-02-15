import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zihnai/providers/user_provider.dart';
import 'package:zihnai/screens/onboarding/name_onboarding.dart';
import 'package:zihnai/screens/onboarding/notification_onboarding.dart';
import 'package:zihnai/screens/onboarding/onboarding_home.dart';
import 'package:zihnai/screens/onboarding/reminder_onboarding.dart';

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
    if (step == 2) {
      return NotificationsOnboarding(
        onNext: goToNextStep,
        onBack: goToPreviousStep,
      );
    } else {
      return ReminderOnboarding(
        onNext: () async {
          Map<String, dynamic> userDataMap = {
            'name': context.read<UserProvider>().name,
            'notification': context.read<UserProvider>().notification,
            'reminder': context.read<UserProvider>().reminder,
            'reminderHours': context.read<UserProvider>().reminderHours,
            'reminderMinutes': context.read<UserProvider>().reminderMinutes,
          };
          try {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            await prefs.setString('user', jsonEncode(userDataMap));
          } catch (_) {
            print('onboardin gOn Save Error');
          }
          ;

          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context) => const Home()),
          // );
        },
        onBack: goToPreviousStep,
      );
    }
  }
}
