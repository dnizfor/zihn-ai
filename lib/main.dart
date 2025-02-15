import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/services.dart';
import 'package:zihnai/screens/home.dart';
import 'package:zihnai/screens/onboarding/onboarding.dart';
import 'package:zihnai/ultils/constant/color.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: HexColor(dark),
    systemNavigationBarColor: HexColor(dark),
  ));

  runApp(Main(
    showHome: false,
  ));
}

class Main extends StatefulWidget {
  const Main({super.key, required this.showHome});
  final bool showHome;

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: HexColor(primary),
            ),
            useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: !widget.showHome ? Onboarding() : Home());
  }
}
