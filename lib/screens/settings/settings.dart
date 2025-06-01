import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zihnai/generated/l10n.dart';
import 'package:zihnai/screens/settings/notification_settings.dart';
import 'package:zihnai/ultils/constant/color.dart';
import 'package:zihnai/ultils/enums/subscription_status_enum.dart';
import 'package:zihnai/ultils/functions/send_mail.dart';
import 'package:zihnai/ultils/providers/user_provider.dart';
import 'package:zihnai/widgets/arrow_forward_button.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:provider/provider.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    context.watch<UserProvider>().userSubscriptionStatus ==
                            SubscriptionStatus.loading
                        ? SizedBox.shrink()
                        : context.read<UserProvider>().userSubscriptionStatus ==
                            SubscriptionStatus.basic
                        ? ArrowForwardButton(
                          title: S.of(context).goPremiumButtonTitle,
                          onTap: () async {
                            await RevenueCatUI.presentPaywallIfNeeded(
                              "default",
                            );
                            if (!context.mounted) return;
                            context.read<UserProvider>().checkPremiumStatus();
                          },
                        )
                        : SizedBox.shrink(),
                    SizedBox(height: 10),
                    ArrowForwardButton(
                      title: S.of(context).notificationSettingsButtonTitle,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (context) => const NotificationSettingScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    ArrowForwardButton(
                      title: S.of(context).rateUsButtonTitle,
                      onTap:
                          () => StoreRedirect.redirect(
                            androidAppId: "com.viralmo.zihnai",
                            iOSAppId: "6742706069",
                          ),
                    ),
                    SizedBox(height: 10),
                    ArrowForwardButton(
                      title: S.of(context).supportButtonTitle,
                      onTap: () => sendMail('Support Zihn AI'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
