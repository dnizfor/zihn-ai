import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zihnai/ultils/constant/color.dart';
import 'package:zihnai/widgets/wheel_time_picker.dart';

class ReminderOnboarding extends StatefulWidget {
  const ReminderOnboarding({
    super.key,
    required this.onNext,
    required this.onBack,
  });
  final void Function() onNext;
  final void Function() onBack;

  @override
  ReminderOnboardingState createState() => ReminderOnboardingState();
}

class ReminderOnboardingState extends State<ReminderOnboarding> {
  bool reminderIsEnabled = false;
  int reminderHours = 0;
  int reminderMinutes = 0;

  void onPress() {
    // widget.setUserData((prev) {
    //   prev['reminder'] = reminderIsEnabled;
    //   prev['reminderHours'] = reminderHours;
    //   prev['reminderMinutes'] = reminderMinutes;
    //   return prev;
    // });
    widget.onNext(); // Move to the next screen
  }

  void timeHandler(int hours, int minutes) {
    // setState(() {
    //   reminderHours = hours;
    //   reminderMinutes = minutes;
    // });

    // widget.setUserData((prev) {
    //   prev['reminderHours'] = hours;
    //   prev['reminderMinutes'] = minutes;
    //   return prev;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(dark),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              BackButton(
                onPressed: widget.onBack,
                color: Colors.white,
              ),

              // Content Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        value: reminderIsEnabled,
                        onChanged: (bool value) {
                          setState(() {
                            reminderIsEnabled = value;
                          });
                        },
                        activeColor: Colors.blue,
                        inactiveThumbColor: Colors.grey,
                      ),
                    ),

                    // Time Picker
                    if (reminderIsEnabled) ...[
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
                        child: WheelTimePicker(),
                      ),
                    ],
                  ],
                ),
              ),

              // Arrow Button (only shown when enabled)
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: IconButton(
                        onPressed: onPress,
                        icon: Icon(Icons.arrow_forward), // Arrow icon
                        iconSize: 30,
                        color: HexColor(dark),
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll<Color>(Colors.white)),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
