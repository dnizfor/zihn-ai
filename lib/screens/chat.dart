import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zihnai/ultils/constant/color.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width * 0.8;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        backgroundColor: HexColor(dark),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            constraints: BoxConstraints(maxWidth: maxWidth),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: HexColor(secondary),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'selam nasilsin ?',
                              style: TextStyle(color: HexColor(white)),
                            ),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            constraints: BoxConstraints(maxWidth: maxWidth),
                            decoration: BoxDecoration(
                              color: HexColor(secondary),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'bende iyiyim sen nasilsin alfabedeki harflerin hepsini saydim yine olmadi yine olmadi',
                              style: TextStyle(color: HexColor(white)),
                            ),
                          ),
                        ]),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'Lets Chat with Ai Therapys',
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
                      onPressed: () {},
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
