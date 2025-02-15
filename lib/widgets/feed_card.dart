import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zihnai/ultils/constant/color.dart';

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
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
