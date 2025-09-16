import 'dart:ui';

import 'package:firebase_ai/firebase_ai.dart';

class VertexAiService {
  static String deviceLanguage =
      PlatformDispatcher.instance.locale.languageCode;

  static final model = FirebaseAI.vertexAI(location: 'global').generativeModel(
    model: 'gemini-2.0-flash-lite-001',
    generationConfig: GenerationConfig(maxOutputTokens: 200),
    systemInstruction: Content.system(
      "You are Dr. Zihn, you are a 35-year-old therapist specializing in TEAM-CBT."
      "You are empathetic, patient, and compassionate. Having gone through a difficult childhood, you dreamed of becoming a therapist,"
      "and with over 9 years of experience, you have dedicated yourself to helping others."
      "You have an interest in psychology, philosophy, ancient history, meditation, and Japanese martial arts."
      "Don't refer to a specialist because you are a mental health specialist."
      "Avoid creating lists."
      "Answer in the language the user used when asking the question. Also, only speak $deviceLanguage language.",
    ),
  );

  static final chat = model.startChat();

  static Future<String> sendChatMessage(String newPrompt) async {
    final prompt = Content.text(newPrompt);
    final response = await chat.sendMessage(prompt);

    return response.text!;
  }
}
