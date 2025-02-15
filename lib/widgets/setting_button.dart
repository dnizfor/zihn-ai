import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zihnai/ultils/constant/color.dart';

class SettingButton extends StatefulWidget {
  const SettingButton({super.key, required this.title, required this.onTap});
  final String title;
  final Function onTap;

  @override
  State<SettingButton> createState() => _SettingButtonState();
}

class _SettingButtonState extends State<SettingButton> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 100,
      tileColor: HexColor(secondary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(
        widget.title,
        style: TextStyle(
            color: HexColor(white), fontSize: 15, fontWeight: FontWeight.bold),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: HexColor(white),
        size: 30,
      ),
      onTap: () => widget.onTap(),
    );
  }
}
