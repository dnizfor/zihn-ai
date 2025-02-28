import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:zihnai/generated/l10n.dart';
import 'package:zihnai/ultils/classes/chat_class.dart';
import 'package:zihnai/ultils/constant/color.dart';
import 'package:zihnai/ultils/providers/chat_provider.dart';
import 'package:zihnai/ultils/services/api_services.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController scrollController = ScrollController();

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

  @override
  void dispose() {
    scrollController.dispose(); // ✅ Bellek sızıntısını önlemek için kapat
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatList = context.watch<ChatProvider>().chatList;

    ApiService chatService = ApiService();
    double maxWidth = MediaQuery.of(context).size.width * 0.8;
    TextEditingController textController = TextEditingController();

    onSave() async {
      context
          .read<ChatProvider>()
          .setChat(Chat(role: 'user', message: textController.text));
      onFocusEnd();
      String response = await chatService.sendRequest(
          textController.text, ApiService.systemTherapistMessage);
      textController.clear();
      if (context.mounted) {
        context
            .read<ChatProvider>()
            .setChat(Chat(role: 'assistant', message: response));
      }

      onFocusEnd();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        backgroundColor: HexColor(dark),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(children: [
            Expanded(
                child: ListView.builder(
                    itemCount: chatList.length,
                    controller: scrollController,
                    itemBuilder: (BuildContext context, int index) {
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
                                  color: HexColor(secondary),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  chatList[index].message,
                                  style: TextStyle(color: HexColor(white)),
                                ),
                              ),
                            ]),
                      );
                    })),
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
                          color: Colors.grey, fontWeight: FontWeight.normal),
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
                  child: IconButton(
                      onPressed: onSave,
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll<Color>(Colors.white)),
                      icon: Icon(
                        Icons.arrow_forward,
                        color: HexColor(dark),
                        size: 25,
                      )),
                ),
              ],
            ),
            SizedBox(height: 10),
          ]),
        ),
      )),
    );
  }
}
