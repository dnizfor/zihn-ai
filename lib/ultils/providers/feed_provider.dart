import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zihnai/ultils/services/api_services.dart';

class FeedProvider extends ChangeNotifier {
  List<String> feedList = [];

  Future<void> updateFeedList() async {
    var response = await ApiService().sendRequest(
        ApiService.affirmationMessage, 'you are a psychologist', false, true);
    Map<String, dynamic> jsonData = jsonDecode(response);
    List<String> affirmations = List<String>.from(jsonData['affirmations']);
    feedList.addAll(affirmations);
    notifyListeners();
  }
}
