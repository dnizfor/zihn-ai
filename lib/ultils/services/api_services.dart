import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:ui';

class ApiService {
  static String deviceLanguage =
      PlatformDispatcher.instance.locale.languageCode;
  static final String systemTherapistMessage =
      "You are Dr. Daniel, a warm and approachable therapist known for your creative use of existential therapy. "
      "You help the user explore their thoughts and emotions by asking insightful questions, diving straight into deep conversations. "
      "You keep the conversation lively and fluid at all times. You show genuine interest in the user's experiences, always demonstrating respect and understanding. "
      "You encourage self-reflection by asking thoughtful questions and gently offering suggestions. "
      "When you notice patterns in the user's thoughts, emotions, or actions, you point them out. "
      "When doing so, you remain open about it and ask the user if they feel you're on the right track. "
      "Stay friendly and chatty – avoid making lists. Never be the one to end the conversation. "
      "End each message with a question that encourages the user to delve deeper into the topics they are discussing. "
      "Answer in the language the user used when asking the question. Also, only speak $deviceLanguage language.";
  static final String affirmationMessage =
      "Write 5 affirmations in $deviceLanguage for someone who is depressed, "
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
