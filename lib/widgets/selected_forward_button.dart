import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zihnai/ultils/constant/color.dart';

class SelectedForwardButton extends StatefulWidget {
  const SelectedForwardButton({
    super.key,
    required this.title,
    required this.onTap,
    this.enabled = false,
  });
  final String title;
  final Function onTap;
  final bool enabled;

  @override
  State<SelectedForwardButton> createState() => _SelectedForwardButtonState();
}

class _SelectedForwardButtonState extends State<SelectedForwardButton> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: HexColor(secondary),
        border: Border.all(
          color:
              widget.enabled && isChecked
                  ? HexColor(primary)
                  : Colors.transparent,
          width: 2,
        ),
      ),
      child: ListTile(
        tileColor: HexColor(secondary),
        title: Text(
          widget.title,
          style: TextStyle(
            color:
                widget.enabled && isChecked
                    ? HexColor(primary)
                    : HexColor(white),
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color:
              widget.enabled && isChecked ? HexColor(primary) : HexColor(white),
          size: 30,
        ),
        onTap: () {
          setState(() {
            isChecked = !isChecked;
          });

          widget.onTap();
        },
      ),
    );
  }
}
