import 'package:flutter/material.dart';
import 'package:zihnai/ultils/classes/chat_class.dart';

class ChatProvider extends ChangeNotifier {
  List<Chat> chatList = [];

  void setChat(Chat newMessage) {
    chatList.add(newMessage);
    notifyListeners();
  }

  void clearChatList() {
    chatList.clear();
    notifyListeners();
  }
}
