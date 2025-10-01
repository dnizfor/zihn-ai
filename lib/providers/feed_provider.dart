import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zihnai/services/api_services.dart';

class FeedProvider extends ChangeNotifier {
  List<String> feedList = [];

  Future<void> updateFeedList() async {
    var response = await ApiService().sendRequest(
      ApiService.createAffirmationMessage(),
      'you are a psychologist',
      false,
      true,
    );
    Map<String, dynamic> jsonData = jsonDecode(response);
    List<String> affirmations = List<String>.from(jsonData['affirmations']);

    feedList.addAll(affirmations);
    notifyListeners();
  }

  Future<void> updatePremiumFeedList() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? selectedTopicList = prefs.getStringList('topics');
    if (selectedTopicList == null) {
      await prefs.setStringList('topics', ["General"]);
      selectedTopicList = ["General"];
    }

    var response = await ApiService().sendRequest(
      ApiService.createCustomAffirmationMessage(selectedTopicList),
      'you are a psychologist',
      false,
      true,
    );

    Map<String, dynamic> jsonData = jsonDecode(response);
    List<String> affirmations = List<String>.from(jsonData['affirmations']);
    feedList.addAll(affirmations);
    notifyListeners();
  }

  void resetFeedList() async {
    feedList = [];
    updatePremiumFeedList();
    notifyListeners();
  }
}
