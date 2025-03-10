import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:zihnai/ultils/constant/color.dart';
import 'package:zihnai/widgets/typing_indicator.dart';

class VoiceChatScreen extends StatefulWidget {
  const VoiceChatScreen({super.key});

  @override
  State<VoiceChatScreen> createState() => _VoiceChatScreenState();
}

class _VoiceChatScreenState extends State<VoiceChatScreen> {
  bool isMicOn = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(dark),
          body: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Lottie.asset(
                  'lib/assets/lotties/voiceChatAnimation.json',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TypingAnimation(),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundColor: HexColor(secondary),
                      radius: 40,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isMicOn = !isMicOn;
                          });
                        },
                        icon: Icon(
                          isMicOn ? Icons.mic : Icons.mic_off,
                          size: 40,
                          color: isMicOn ? HexColor(white) : HexColor(alert),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: HexColor(secondary),
                      radius: 40,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          size: 40,
                          color: HexColor(white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
