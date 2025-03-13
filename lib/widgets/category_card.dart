import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zihnai/ultils/constant/color.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.enabled = true,
  });
  final String title;
  final IconData icon;
  final Function onTap;
  final bool enabled;
  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool isChecked = false;

  @override
  void didUpdateWidget(covariant CategoryCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.enabled != widget.enabled && !widget.enabled) {
      setState(() {
        isChecked = false;
      });
    }
  }

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

      child: CheckboxListTile(
        onChanged: (value) {
          setState(() {
            isChecked = !isChecked;
          });
          widget.onTap();
        },
        tileColor: HexColor(secondary),
        value: isChecked && widget.enabled,
        activeColor: HexColor(primary),
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
        secondary: Icon(
          widget.icon,
          color:
              widget.enabled && isChecked ? HexColor(primary) : HexColor(white),
          size: 30,
        ),

        // trailing: Checkbox(
        //   value: isChecked,
        //   onChanged:
        // (value) => setState(() {
        //   isChecked = !isChecked;
        // }),
        // ),
        // leading: Icon(Icons.headphones, color: HexColor(white), size: 30),
        // // onTap: () => widget.onTap(),
        // onTap: () => (),
      ),
    );
  }
}
