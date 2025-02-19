import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zihnai/ultils/constant/color.dart';

class NetworkError extends StatefulWidget {
  const NetworkError({super.key});

  @override
  State<NetworkError> createState() => _NetworkErrorState();
}

class _NetworkErrorState extends State<NetworkError> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(dark),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off,
            color: HexColor(primary),
            size: 150,
          ),
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Text(
              'Oops! No Internet',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: HexColor(white),
                  fontSize: 25),
            ),
          )
        ],
      )),
    );
  }
}
