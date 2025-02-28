import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:ui';

import 'package:zihnai/ultils/classes/chat_class.dart';

class ApiService {
  static String deviceLanguage =
      PlatformDispatcher.instance.locale.languageCode;

  static String createMessageWithHistory(
      String message, List<Chat> chatHistory) {
    String lastHistory = chatHistory
        .where((chat) => chat.role == "user" || chat.role == "assistant")
        .toList()
        .reversed
        .take(6)
        .map((chat) => chat.message)
        .toList()
        .reversed
        .join(" ");
    return "$message  context=$lastHistory";
  }

  static final String systemTherapistMessage =
      "You are Dr. Daniel, a warm and insightful existential therapist."
      "You keep conversations deep and fluid, guiding the user in self-exploration."
      "Never end abruptly—always finish with a thought-provoking question."
      "Answer in the language the user used when asking the question. Also, only speak $deviceLanguage language.";
  static final String affirmationMessage =
      "Write 15 affirmations in $deviceLanguage for someone who is depressed, "
      "separating each one with \\n. Write only the sentences, nothing else.";

  Future<String> sendRequest(String message, String systemMessage,
      [bool useSeed = true, bool jsonMode = false]) async {
    final response = await http.post(
      Uri.parse('https://text.pollinations.ai/'),
      headers: {"Content-Type": "application/json"}, // JSON gönderirken gerekli
      body: jsonEncode({
        "messages": [
          {"role": "system", "content": systemMessage},
          {"role": "user", "content": message}
        ],
        "model": "openai",
        if (useSeed) "seed": 42, // JSON içinde sayı olarak kalabilir
        "jsonMode": jsonMode,
        "private": true
      }),
    );

    return response.body;
  }
}
