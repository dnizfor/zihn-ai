import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zihnai/generated/l10n.dart';
import 'package:zihnai/screens/feed/smart_customization.dart';
import 'package:zihnai/ultils/constant/color.dart';
import 'package:zihnai/widgets/category_card.dart';
import 'package:zihnai/widgets/selected_forward_button.dart';

class FeedCustomizationScreen extends StatefulWidget {
  const FeedCustomizationScreen({super.key});

  @override
  State<FeedCustomizationScreen> createState() =>
      _FeedCustomizationScreenState();
}

class _FeedCustomizationScreenState extends State<FeedCustomizationScreen> {
  bool isCheckedAI = false;

  void updateAIStatus(value) {
    setState(() {
      isCheckedAI = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> feedCategories = [
      {
        "category": "General",
        "icon": Icons.gesture,
        "label": S.of(context).categoryCardGeneral,
      },
      {
        "category": "Stress and anxiety",
        "icon": Icons.sick,
        "label": S.of(context).categoryCardAnxiety,
      },
      {
        "category": "Finding love",
        "icon": Icons.favorite,
        "label": S.of(context).categoryCardLove,
      },
      {
        "category": "Personal Development",
        "icon": Icons.park,
        "label": S.of(context).categoryCardGrowth,
      },
      {
        "category": "Positive thinking",
        "icon": Icons.airplanemode_active,
        "label": S.of(context).categoryCardOptimistic,
      },
      {
        "category": "Body affirmation",
        "icon": Icons.accessibility,
        "label": S.of(context).categoryCardBodyAffirmation,
      },
      {
        "category": "Tough days",
        "icon": Icons.cloud,
        "label": S.of(context).categoryCardtoughDays,
      },
      {
        "category": "Self-confidence",
        "icon": Icons.brightness_high,
        "label": S.of(context).categoryCardSelfConfidence,
      },
      {
        "category": "Happiness",
        "icon": Icons.sunny,
        "label": S.of(context).categoryCardHappiness,
      },
      {
        "category": "Work success",
        "icon": Icons.work,
        "label": S.of(context).categoryWorkSuccess,
      },
      {
        "category": "Calmness",
        "icon": Icons.spa,
        "label": S.of(context).categoryCardCalmness,
      },
      {
        "category": "Gratitude",
        "icon": Icons.handshake,
        "label": S.of(context).categoryCardGratitude,
      },
      {
        "category": "Health",
        "icon": Icons.health_and_safety,
        "label": S.of(context).categoryCardHealth,
      },
      {
        "category": "Love yourself",
        "icon": Icons.favorite_border,
        "label": S.of(context).categoryCardSelfLove,
      },
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(dark),
        appBar: AppBar(
          title: Text(
            S.of(context).feedCustomizationScreenAppBarTitle,
            style: TextStyle(
              color: HexColor(white),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: HexColor(dark),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: HexColor(white)),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: feedCategories.length,
                  itemBuilder: (context, index) {
                    var category = feedCategories[index];
                    if (index == 0) {
                      return Column(
                        children: [
                          SelectedForwardButton(
                            title: S.of(context).generateWithAiTitle,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          const SmartFeedCustomizationScreen(),
                                ),
                              );
                            },
                            enabled: isCheckedAI,
                          ),
                          Divider(
                            color: HexColor(white),
                            thickness: 1,
                            indent: 80,
                            endIndent: 80,
                            height: 40,
                          ),

                          CategoryCard(
                            title: category["label"],
                            icon: category["icon"],
                            onTap: () => updateAIStatus(false),
                            enabled: !isCheckedAI,
                          ),
                        ],
                      );
                    }
                    return CategoryCard(
                      title: category["label"],
                      icon: category["icon"],
                      onTap: () => updateAIStatus(false),
                      enabled: !isCheckedAI,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
