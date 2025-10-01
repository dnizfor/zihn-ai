import 'package:flutter/material.dart';
import 'package:zihnai/ultils/color.dart';

class TopicCard extends StatefulWidget {
  const TopicCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.value,
  });
  final String title;
  final IconData icon;
  final Function onTap;
  final bool value;
  @override
  State<TopicCard> createState() => _TopicCardState();
}

class _TopicCardState extends State<TopicCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CustomColors.secondary,
        border: Border.all(
          color: widget.value ? CustomColors.primary : Colors.transparent,
          width: 2,
        ),
      ),

      child: CheckboxListTile(
        onChanged: (value) {
          widget.onTap();
        },
        tileColor: CustomColors.secondary,
        value: widget.value,
        activeColor: CustomColors.primary,
        title: Text(
          widget.title,
          style: TextStyle(
            color: widget.value ? CustomColors.primary : Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        secondary: Icon(
          widget.icon,
          color: widget.value ? CustomColors.primary : Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
