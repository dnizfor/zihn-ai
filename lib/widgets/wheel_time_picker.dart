import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wheel_picker/wheel_picker.dart';
import 'package:zihnai/ultils/constant/color.dart';

class WheelTimePicker extends StatefulWidget {
  const WheelTimePicker({
    super.key,
    required this.setHours,
    required this.setMinutes,
  });

  final void Function(int hours) setHours;
  final void Function(int minutes) setMinutes;

  @override
  State<WheelTimePicker> createState() => _WheelTimePickerState();
}

class _WheelTimePickerState extends State<WheelTimePicker> {
  final now = TimeOfDay.now();
  late final _hoursWheel = WheelPickerController(
    itemCount: 24,
    initialIndex: 0,
  );
  late final _minutesWheel = WheelPickerController(
    itemCount: 60,
    initialIndex: 0,
    mounts: [_hoursWheel],
  );

  @override
  Widget build(BuildContext context) {
    const textStyle =
        TextStyle(fontSize: 26.0, height: 1.5, color: Colors.white);
    final wheelStyle = WheelPickerStyle(
      itemExtent: textStyle.fontSize! * textStyle.height!, // Text height
      squeeze: 1.25,
      diameterRatio: .8,
      surroundingOpacity: .25,
      magnification: 1.2,
    );

    Widget itemBuilder(BuildContext context, int index) {
      return Text("$index".padLeft(2, '0'), style: textStyle);
    }

    final timeWheels = <Widget>[
      for (final wheelController in [_hoursWheel, _minutesWheel])
        Expanded(
          child: WheelPicker(
            builder: itemBuilder,
            controller: wheelController,
            onIndexChanged: (index, interactionType) => {
              if (wheelController == _hoursWheel)
                {widget.setHours(index)}
              else if (wheelController == _minutesWheel)
                {widget.setMinutes(index)}
            },
            looping: true,
            style: wheelStyle,
            selectedIndexColor: Colors.white,
          ),
        ),
    ];
    timeWheels.insert(1, const Text(":", style: textStyle));

    // final amPmWheel = Expanded(
    //   child: WheelPicker(
    //     itemCount: 2,
    //     builder: (context, index) {
    //       return Text(["AM", "PM"][index], style: textStyle);
    //     },
    //     initialIndex: (now.period == DayPeriod.am) ? 0 : 1,
    //     looping: false,
    //     style: wheelStyle.copyWith(
    //       shiftAnimationStyle: const WheelShiftAnimationStyle(
    //         duration: Duration(seconds: 1),
    //         curve: Curves.bounceOut,
    //       ),
    //     ),
    //   ),
    // );

    return Container(
      decoration: BoxDecoration(
          color: HexColor(secondary), borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: double.infinity,
        height: 200.0,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _centerBar(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  ...timeWheels,
                  // const SizedBox(width: 6.0),
                  // amPmWheel,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Don't forget to dispose the controllers at the end.
    _hoursWheel.dispose();
    _minutesWheel.dispose();
    super.dispose();
  }

  Widget _centerBar(BuildContext context) {
    return Center(
      child: Container(
        height: 38.0,
        decoration: BoxDecoration(
          color: const Color(0xFFC3C9FA).withAlpha(26),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
