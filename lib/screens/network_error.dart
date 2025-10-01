import 'package:flutter/material.dart';
import 'package:zihnai/generated/l10n.dart';
import 'package:zihnai/ultils/color.dart';

class NetworkError extends StatefulWidget {
  const NetworkError({super.key});

  @override
  State<NetworkError> createState() => _NetworkErrorState();
}

class _NetworkErrorState extends State<NetworkError> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.dark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off, color: CustomColors.primary, size: 150),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                S.of(context).networkErrorTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
