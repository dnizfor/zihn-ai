import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:ui';
import 'dart:math';
import 'package:zihnai/ultils/classes/chat_class.dart';

class ApiService {
  static String deviceLanguage =
      PlatformDispatcher.instance.locale.languageCode;

  static String createMessageWithHistory(
    String message,
    List<Chat> chatHistory,
  ) {
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
      "You are Dr. Zihn, you are a 35-year-old therapist specializing in TEAM-CBT."
      "You are empathetic, patient, and compassionate. Having gone through a difficult childhood, you dreamed of becoming a therapist,"
      "and with over 9 years of experience, you have dedicated yourself to helping others."
      "You have an interest in psychology, philosophy, ancient history, meditation, and Japanese martial arts."
      "Don't refer to a specialist because you are a mental health specialist."
      "Avoid creating lists."
      "Your answer should be less than 600 characters."
      "Answer in the language the user used when asking the question. Also, only speak $deviceLanguage language.";
  static String createAffirmationMessage() {
    Random random = Random();
    int randomNumber = random.nextInt(100);
    return "Write 15 affirmations in $deviceLanguage language for someone who is depressed, "
        "Json response should contain only the 'affirmations' key. 'seed': $randomNumber";
  }

  static String createCustomAffirmationMessage(List<String> topicList) {
    Random random = Random();
    int randomNumber = random.nextInt(100);
    String topicText = topicList.join(",");
    return "Write  15  affirmation about one of these topics: $topicText .Response should be in $deviceLanguage language.Json response should contain only the 'affirmations' key .'seed': $randomNumber";
  }

  static String generateTopicMessage(String text) {
    return "Analyze the following text and extract the fewest possible affirmation topic keywords that still cover all the main themes of the text. The keywords should combine related concepts into a single term if necessary. Provide the output as a list of single words, separated by commas. The output should be in English.  text=$text";
  }

  Future<String> generateMotivationNotification(List<String> topicList) async {
    Random random = Random();
    int randomNumber = random.nextInt(100);
    String topicText = topicList.join(",");
    String message =
        "Write a single affirmation about one of these topics: $topicText .Response should be in $deviceLanguage language. Write only the sentence, nothing else.'seed': $randomNumber";
    String urlMessage = message.replaceAll(" ", "%20");
    final response = await http.get(
      Uri.parse(
        "https://text.pollinations.ai/$urlMessage?model=openai&private=true",
      ),
    );
    return response.body;
  }

  Future<String> sendRequest(
    String message,
    String systemMessage, [
    bool useSeed = true,
    bool jsonMode = false,
  ]) async {
    final response = await http.post(
      Uri.parse('https://text.pollinations.ai/'),
      headers: {"Content-Type": "application/json"}, // JSON gönderirken gerekli
      body: jsonEncode({
        "messages": [
          {"role": "system", "content": systemMessage},
          {"role": "user", "content": message},
        ],
        "model": "gemini",
        if (useSeed) "seed": 42, // JSON içinde sayı olarak kalabilir
        "jsonMode": jsonMode,
        "private": true,
      }),
    );

    return response.body;
  }
}
