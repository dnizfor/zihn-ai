import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:zihnai/providers/user_provider.dart';
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

  void setHours(int hours) {
    setState(() {
      reminderHours = hours;
    });
  }

  void setMinutes(int minutes) {
    setState(() {
      reminderMinutes = minutes;
    });
  }

  @override
  Widget build(BuildContext context) {
    void onPress() {
      context
          .read<UserProvider>()
          .setReminder(reminderIsEnabled, reminderHours, reminderMinutes);
      widget.onNext();
    }

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
                        child: WheelTimePicker(
                          setHours: setHours,
                          setMinutes: setMinutes,
                        ),
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
