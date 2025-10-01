import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'package:zihnai/generated/l10n.dart';
import 'package:zihnai/ultils/chat.dart';
import 'package:zihnai/ultils/color.dart';
import 'package:zihnai/enums/subscription_status_enum.dart';
import 'package:zihnai/providers/chat_provider.dart';
import 'package:zihnai/providers/user_provider.dart';
import 'package:zihnai/services/api_services.dart';
import 'package:zihnai/services/vertex_ai_service.dart';
import 'package:zihnai/widgets/typing_indicator.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController scrollController = ScrollController();
  final TextEditingController textController = TextEditingController();
  String userMessage = '';
  bool isListening = false;
  stt.SpeechToText? _speechToText;
  bool showTypingAnimation = false;
  void onFocusEnd() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void updateUserMessage() {
    final text = textController.text;
    setState(() {
      userMessage = text;
    });
  }

  @override
  void initState() {
    super.initState();
    _speechToText = stt.SpeechToText();

    textController.addListener(updateUserMessage);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.read<UserProvider>().userSubscriptionStatus ==
          SubscriptionStatus.basic) {
        toastification.show(
          context: context,
          description: Text(S.of(context).bePremiumToastification),
          autoCloseDuration: const Duration(seconds: 3),
          style: ToastificationStyle.fillColored,
          primaryColor: CustomColors.primary,
          showIcon: false,
        );
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatList = context.watch<ChatProvider>().chatList;
    ApiService chatService = ApiService();
    double maxWidth = MediaQuery.of(context).size.width * 0.8;

    void onSave(usrMsg) async {
      textController.clear();
      if (usrMsg.trim() == '') {
        return;
      }
      context.read<ChatProvider>().setChat(Chat(role: 'user', message: usrMsg));
      onFocusEnd();
      setState(() {
        showTypingAnimation = true;
      });
      late String response;
      if (context.read<UserProvider>().userSubscriptionStatus ==
          SubscriptionStatus.premium) {
        response = await VertexAiService.sendChatMessage(usrMsg);
      } else {
        response = await chatService.sendRequest(
          usrMsg,
          ApiService.createMessageWithHistory(
            ApiService.systemTherapistMessage,
            chatList,
          ),
        );
      }

      if (context.mounted) {
        context.read<ChatProvider>().setChat(
          Chat(role: 'assistant', message: response),
        );
      }
      setState(() {
        showTypingAnimation = false;
      });

      onFocusEnd();
    }

    void capture() async {
      if (!isListening) {
        // _speechToText null değilse initialize'ı çağır
        if (_speechToText != null) {
          bool listen = await _speechToText!.initialize();
          if (listen) {
            setState(() {
              isListening = true;
            });
            await _speechToText?.listen(
              onResult:
                  (result) => {
                    if (result.finalResult)
                      {
                        setState(() {
                          isListening = false;
                        }),
                        onSave(result.recognizedWords),
                      },
                  },
            );
          }
        }
      } else {
        setState(() {
          isListening = false;
        });
        _speechToText?.stop();
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: CustomColors.dark,
          body: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: chatList.length + (showTypingAnimation ? 1 : 0),
                    controller: scrollController,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == chatList.length) {
                        return TypingAnimation();
                      }
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment:
                              chatList[index].role == 'assistant'
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.end,
                          children: [
                            Container(
                              constraints: BoxConstraints(maxWidth: maxWidth),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: CustomColors.secondary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                chatList[index].message,
                                style: TextStyle(color: CustomColors.white),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        controller: textController,
                        maxLines: null,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: S.of(context).message,
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: AvatarGlow(
                        startDelay: const Duration(milliseconds: 1000),
                        glowColor: CustomColors.primary,
                        glowShape: BoxShape.circle,
                        animate: isListening,
                        curve: Curves.fastOutSlowIn,
                        child: Material(
                          elevation: 8.0,
                          shape: const CircleBorder(),
                          color: Colors.transparent,
                          child: IconButton(
                            onPressed:
                                userMessage.trim() == ""
                                    ? capture
                                    : () => onSave(textController.text),
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll<Color>(
                                Colors.white,
                              ),
                            ),
                            icon: Icon(
                              userMessage.trim() == ""
                                  ? Icons.mic
                                  : Icons.arrow_forward,
                              color:
                                  isListening
                                      ? CustomColors.primary
                                      : CustomColors.dark,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
