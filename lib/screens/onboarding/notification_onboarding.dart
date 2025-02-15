import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zihnai/ultils/constant/color.dart';

class NotificationsOnboarding extends StatefulWidget {
  const NotificationsOnboarding({
    super.key,
    required this.onNext,
    required this.onBack,
  });
  final void Function() onNext;
  final void Function() onBack;
  @override
  NotificationsOnboardingState createState() =>
      NotificationsOnboardingState(); // Public state class
}

class NotificationsOnboardingState extends State<NotificationsOnboarding> {
  // Public state class
  bool notificationIsEnabled = false;

  void onPress() {
    // widget.setUserData();
    widget.onNext();
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
                      'Affirmation Notification',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Enable notifications for regular motivational notifications.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
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
                        value: notificationIsEnabled,
                        onChanged: (bool value) {
                          setState(() {
                            notificationIsEnabled = value;
                          });
                        },
                        title: Text(
                          'Enable Notifications',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        activeColor: Colors.blue,
                        inactiveThumbColor: Colors.grey,
                        inactiveTrackColor: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              // Arrow Button
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
