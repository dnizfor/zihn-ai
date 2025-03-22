import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:zihnai/ultils/constant/color.dart';
import 'package:zihnai/ultils/providers/feed_provider.dart';
import 'package:zihnai/widgets/feed_card.dart';
import 'package:zihnai/widgets/loading_widget.dart';
import 'package:zihnai/ultils/providers/user_provider.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final feedList = context.watch<FeedProvider>().feedList;
    return Container(
      color: HexColor(dark),
      child:
          feedList.isEmpty
              ? LoadingWidget()
              : PageView.builder(
                scrollDirection: Axis.vertical,
                onPageChanged:
                    (index) => {
                      if (index > feedList.length - 5)
                        {
                          context.read<UserProvider>().isUserPremium
                              ? context
                                  .read<FeedProvider>()
                                  .updatePremiumFeedList()
                              : context.read<FeedProvider>().updateFeedList(),
                        },
                    },
                itemCount: feedList.length,
                controller: pageController,
                itemBuilder:
                    (context, index) => (FeedCard(title: feedList[index])),
              ),
    );
  }
}
