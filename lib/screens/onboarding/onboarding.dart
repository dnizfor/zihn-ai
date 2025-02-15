import 'package:flutter/material.dart';
import 'package:zihnai/screens/home.dart';
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
        onNext: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const Home()),
          );
        },
        onBack: goToPreviousStep,
      );
    }
  }
}
