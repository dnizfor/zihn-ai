import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zihnai/ultils/constant/color.dart';
import 'package:zihnai/widgets/setting_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        backgroundColor: HexColor(dark),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Image.asset(
                      'lib/assets/images/sunset.jpg',
                      height: 150,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    SizedBox(height: 10),
                    SettingButton(
                      title: 'Be Premium',
                      onTap: () {},
                    ),
                    SizedBox(height: 10),
                    SettingButton(
                      title: 'Notifications',
                      onTap: () {},
                    ),
                    SizedBox(height: 10),
                    SettingButton(
                      title: 'Rate Us!',
                      onTap: () {},
                    ),
                    SizedBox(height: 10),
                    SettingButton(
                      title: 'Feedback & Contact',
                      onTap: () {},
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
