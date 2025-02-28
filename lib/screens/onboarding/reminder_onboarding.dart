import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:zihnai/generated/l10n.dart';
import 'package:zihnai/ultils/providers/user_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    void onPress() {
      widget.onNext();
    }

    void setHours(int hours) {
      context.read<UserProvider>().setReminderHours(hours);
    }

    void setMinutes(int minutes) {
      context.read<UserProvider>().setReminderMinutes(
            minutes,
          );
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
                          S.of(context).reminderButtonTitle,
                          style: TextStyle(color: Colors.white, fontSize: 15),
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
                          S.of(context).timePickerDescription,
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
                              context.read<UserProvider>().reminderHours,
                          initialMinutes:
                              context.read<UserProvider>().reminderMinutes,
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
