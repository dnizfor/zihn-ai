import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:zihnai/screens/chat.dart';
import 'package:zihnai/screens/feed.dart';
import 'package:zihnai/screens/settings.dart';
import 'package:zihnai/ultils/constant/color.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: HexColor(dark),
    systemNavigationBarColor: HexColor(dark),
  ));
  runApp(Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currenIndex = 0;
  List<Widget> body = const [
    FeedScreen(),
    ChatScreen(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: HexColor(primary),
          ),
          useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: body[_currenIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: HexColor(dark),
          selectedItemColor: HexColor(primary),
          unselectedItemColor: HexColor(white),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currenIndex,
          onTap: (int newIndex) => setState(() => _currenIndex = newIndex),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Ionicons.bookmark), label: 'feed'),
            BottomNavigationBarItem(
                icon: Icon(Ionicons.bonfire), label: 'chat'),
            BottomNavigationBarItem(
                icon: Icon(Ionicons.settings_sharp), label: 'settings'),
          ],
        ),
      ),
    );
  }
}
