import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';
import 'package:zihnai/screens/chat/chat.dart';
import 'package:zihnai/screens/feed.dart';
import 'package:zihnai/screens/settings/settings.dart';
import 'package:zihnai/ultils/constant/color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currenIndex = 0;
  List<Widget> body = const [FeedScreen(), ChatScreen(), SettingsScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: body[_currenIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: HexColor(dark),
        selectedItemColor: HexColor(primary),
        unselectedItemColor: HexColor(white),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currenIndex,
        onTap: (int newIndex) => setState(() => _currenIndex = newIndex),
        items: [
          BottomNavigationBarItem(icon: Icon(Ionicons.bookmark), label: 'feed'),
          BottomNavigationBarItem(icon: Icon(Ionicons.bonfire), label: 'chat'),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.settings_sharp),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}
