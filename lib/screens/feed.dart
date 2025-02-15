import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zihnai/ultils/constant/color.dart';
import 'package:zihnai/widgets/feed_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<String> affirmationList = ['english', 'spanis', 'franchese'];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor(dark),
      child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: affirmationList.length,
          itemBuilder: (context, index) =>
              (FeedCard(title: affirmationList[index]))),
    );
  }
}
