import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zihnai/screens/settings/notification_settings.dart';
import 'package:zihnai/ultils/constant/color.dart';
import 'package:zihnai/ultils/functions/send_mail.dart';
import 'package:zihnai/widgets/setting_button.dart';
import 'package:store_redirect/store_redirect.dart';

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
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const NotificationSettingScreen()),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    SettingButton(
                        title: 'Rate Us!',
                        onTap: () => StoreRedirect.redirect(
                            androidAppId: "com.iyaffle.rangoli",
                            iOSAppId: "585027354")),
                    SizedBox(height: 10),
                    SettingButton(
                      title: 'Feedback & Contact',
                      onTap: () => sendMail('Feedback & Contact Zihn AI'),
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
