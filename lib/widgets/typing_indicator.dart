import 'package:flutter/material.dart';
import 'package:flutter_typing_indicator/flutter_typing_indicator.dart';

class TypingAnimation extends StatelessWidget {
  const TypingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return TypingIndicator(
      backgroundColor: Colors.transparent,
      duration: Duration(milliseconds: 1500),
    );
  }
}
