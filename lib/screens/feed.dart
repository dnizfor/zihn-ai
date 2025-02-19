import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zihnai/ultils/constant/color.dart';
import 'package:zihnai/ultils/services/api_services.dart';
import 'package:zihnai/widgets/feed_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<String> affirmationList = ['...'];
  ApiService affirmationService = ApiService();
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    updateAffirmations();
  }

  void updateAffirmations() async {
    if (!mounted) return;
    var response = await affirmationService.sendRequest(
        ApiService.affirmationMessage, 'you are a psychologist', false, true);
    if (!mounted) return;
    Map<String, dynamic> jsonData = jsonDecode(response);
    List<String> affirmations = List<String>.from(jsonData['affirmations']);
    setState(() {
      affirmationList.addAll(affirmations);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor(dark),
      child: PageView.builder(
          scrollDirection: Axis.vertical,
          onPageChanged: (index) => {
                if (index % 3 == 0 && index > affirmationList.length - 7)
                  {updateAffirmations()}
              },
          itemCount: affirmationList.length,
          controller: pageController,
          itemBuilder: (context, index) =>
              (FeedCard(title: affirmationList[index]))),
    );
  }
}
