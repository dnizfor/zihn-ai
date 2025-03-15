import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zihnai/ultils/constant/color.dart';
import 'package:avatar_glow/avatar_glow.dart';

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
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: AvatarGlow(
                    startDelay: const Duration(milliseconds: 1000),
                    glowColor: HexColor(primary),
                    glowShape: BoxShape.circle,
                    animate: isMicOn,
                    curve: Curves.fastOutSlowIn,
                    child: const Material(
                      elevation: 8.0,
                      shape: CircleBorder(),
                      color: Colors.transparent,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('lib/assets/icon/icon.png'),
                        radius: 100.0,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 40),
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
