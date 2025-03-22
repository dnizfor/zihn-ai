import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:zihnai/screens/feed/feed_customization.dart';
import 'package:zihnai/ultils/constant/color.dart';
import 'package:zihnai/ultils/providers/user_provider.dart';

class FeedCard extends StatefulWidget {
  const FeedCard({super.key, required this.title});
  final String title;

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/card_bg.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 24,
                color: HexColor(white),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: HexColor(secondary),
              ),
              child: IconButton(
                onPressed: () async {
                  if (!context.read<UserProvider>().isUserPremium) {
                    await RevenueCatUI.presentPaywallIfNeeded("default");
                    if (!context.mounted) return;
                    context.read<UserProvider>().checkPremiumStatus();
                    return;
                  }
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FeedCustomizationScreen(),
                    ),
                  );
                },
                icon: Icon(Ionicons.grid_outline),
                color: HexColor(white),
                iconSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
