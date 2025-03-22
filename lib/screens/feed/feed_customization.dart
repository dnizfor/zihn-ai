import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zihnai/generated/l10n.dart';
import 'package:zihnai/screens/feed/smart_customization.dart';
import 'package:zihnai/ultils/constant/color.dart';
import 'package:zihnai/ultils/providers/feed_provider.dart';
import 'package:zihnai/widgets/topic_card.dart';
import 'package:zihnai/widgets/selected_forward_button.dart';

class FeedCustomizationScreen extends StatefulWidget {
  const FeedCustomizationScreen({super.key});

  @override
  State<FeedCustomizationScreen> createState() =>
      _FeedCustomizationScreenState();
}

class _FeedCustomizationScreenState extends State<FeedCustomizationScreen> {
  bool isCheckedAI = true;
  List<String> selectedList = [];

  void updateAIStatus(value) {
    setState(() {
      isCheckedAI = value;
    });
  }

  Future<void> loadListFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? selectedTopicList = prefs.getStringList('topics');
    if (selectedTopicList != null) {
      setState(() {
        selectedList = selectedTopicList;
      });
    } else {
      setState(() {
        selectedList = [...selectedList, "General"];
      });
    }
    bool? savedIsCheckedAIData = prefs.getBool('isCheckedAI');
    if (savedIsCheckedAIData != null) {
      setState(() {
        isCheckedAI = savedIsCheckedAIData;
      });
    } else {
      setState(() {
        isCheckedAI = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadListFromSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> onBack() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList('topics', selectedList);
      prefs.setBool('isCheckedAI', isCheckedAI);
      if (!context.mounted) return;
      context.read<FeedProvider>().resetFeedList();
      Navigator.pop(context);
    }

    List<Map<String, dynamic>> feedTopics = [
      {
        "topic": "General",
        "icon": Icons.gesture,
        "label": S.of(context).topicCardGeneral,
      },
      {
        "topic": "Stress and anxiety",
        "icon": Icons.sick,
        "label": S.of(context).topicCardAnxiety,
      },
      {
        "topic": "Finding love",
        "icon": Icons.favorite,
        "label": S.of(context).topicCardLove,
      },
      {
        "topic": "Personal Development",
        "icon": Icons.park,
        "label": S.of(context).topicCardGrowth,
      },
      {
        "topic": "Positive thinking",
        "icon": Icons.airplanemode_active,
        "label": S.of(context).topicCardOptimistic,
      },
      {
        "topic": "Body affirmation",
        "icon": Icons.accessibility,
        "label": S.of(context).topicCardBodyAffirmation,
      },
      {
        "topic": "Tough days",
        "icon": Icons.cloud,
        "label": S.of(context).topicCardToughDays,
      },
      {
        "topic": "Self-confidence",
        "icon": Icons.brightness_high,
        "label": S.of(context).topicCardSelfConfidence,
      },
      {
        "topic": "Happiness",
        "icon": Icons.sunny,
        "label": S.of(context).topicCardHappiness,
      },
      {
        "topic": "Work success",
        "icon": Icons.work,
        "label": S.of(context).topicWorkSuccess,
      },
      {
        "topic": "Calmness",
        "icon": Icons.spa,
        "label": S.of(context).topicCardCalmness,
      },
      {
        "topic": "Gratitude",
        "icon": Icons.handshake,
        "label": S.of(context).topicCardGratitude,
      },
      {
        "topic": "Health",
        "icon": Icons.health_and_safety,
        "label": S.of(context).topicCardHealth,
      },
      {
        "topic": "Love yourself",
        "icon": Icons.favorite_border,
        "label": S.of(context).topicCardSelfLove,
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
            onPressed: onBack,
            icon: Icon(Icons.arrow_back, color: HexColor(white)),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: feedTopics.length,
                  itemBuilder: (context, index) {
                    var topic = feedTopics[index];
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

                          TopicCard(
                            title: topic["label"],
                            icon: topic["icon"],
                            onTap:
                                () => {
                                  updateAIStatus(false),
                                  if (selectedList.contains(topic["topic"]))
                                    {
                                      setState(() {
                                        selectedList =
                                            selectedList
                                                .where(
                                                  (item) =>
                                                      item != topic["topic"],
                                                )
                                                .toList();
                                      }),
                                    }
                                  else
                                    {
                                      selectedList = [
                                        ...selectedList,
                                        topic["topic"],
                                      ],
                                    },
                                },
                            value:
                                selectedList.contains(topic["topic"]) &&
                                !isCheckedAI,
                          ),
                        ],
                      );
                    }
                    return TopicCard(
                      title: topic["label"],
                      icon: topic["icon"],
                      onTap:
                          () => {
                            updateAIStatus(false),
                            if (selectedList.contains(topic["topic"]))
                              {
                                setState(() {
                                  selectedList =
                                      selectedList
                                          .where(
                                            (item) => item != topic["topic"],
                                          )
                                          .toList();
                                }),
                              }
                            else
                              {
                                selectedList = [
                                  ...selectedList,
                                  topic["topic"],
                                ],
                              },
                          },
                      value:
                          selectedList.contains(topic["topic"]) && !isCheckedAI,
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
