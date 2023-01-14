import 'package:flutter/material.dart';
import 'dart:math' as math;

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({super.key});


  // final ValueChanged<int> onChange;
  // final double startTime;
  // final double endTime;
  // final double time;



  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {

  Offset offset = const Offset(81.0, 0.0);

  String timeText = '11:30 am';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: _onTapDown,
      child: Container(
        height: 120,
        width: 370,
        child: Stack(
          children: [
            Positioned(
              left: offset.dx - 60,
                top: 0,
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.withOpacity(.5)
                      ),
                      child: Center(child: Text(timeText)),),
                    const SizedBox(height: 5,),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.red
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 4,
                      color: Colors.black,
                    )
                  ],
                )
            ),
            Positioned(
              bottom: 0,
                left: 0,
                child: Container(
                  height: 80,
                    width: 370,
                    child: _drawVerticalLine())),
            const Positioned(
              bottom: 0,
                left: 0,
                child: Text('10.30 am')
            ),
            const Positioned(
                bottom: 0,
                right: 0,
                child: Text('5.30 pm')
            )
          ],
        ),
      ),
    );
  }

  _onTapDown(TapDownDetails tapDownDetails) {
    // int height = _globalOffsetToHeight(tapDownDetails.globalPosition);
    // widget.onChange(_normalizeHeight(height));
    setState(() {
      offset = Offset(getFinalOffset(tapDownDetails.localPosition.dx), 0);
      getFinalOffset(offset.dx);
    });

  }

  double getFinalOffset(double givenOffset){

     double widthPerUnit = 371 / 14 - .1;

     double finalUnit = givenOffset / widthPerUnit;

     int targetUnit = finalUnit.round();

     double finalOffset = targetUnit * widthPerUnit;

    switch(targetUnit) {
      case 0 :
        timeText = '10: 30 am';
        break;
      case 1 :
        timeText = '11: 00 am';
        break;
      case 2 :
        timeText = '11: 30 am';
        break;
      case 3 :
        timeText = '12: 00 pm';
        break;
      case 4 :
        timeText = '12: 30 pm';
        break;
      case 5 :
        timeText = '01: 00 pm';
        break;
      case 6 :
        timeText = '01: 30 pm';
        break;
      case 7 :
        timeText = '02: 00 pm';
        break;
      case 8 :
        timeText = '02: 30 pm';
        break;
      case 9 :
        timeText = '03: 00 pm';
        break;
      case 10 :
        timeText = '03: 30 pm';
        break;
      case 11 :
        timeText = '04: 00 pm';
        break;
      case 12 :
        timeText = '04: 30 pm';
        break;
      case 13 :
        timeText = '05: 00 pm';
        break;
      case 14 :
        timeText = '05: 30 pm';
        break;
    }

    return finalOffset;
  }

  Widget _drawVerticalLine() {
    List<Widget> labels = List.generate(
      15,
          (idx) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 20,
              width: 2,
              color: Colors.black,
            ),
          ],
        );
      },
    );

    return Align(
      alignment: Alignment.centerRight,
      child: IgnorePointer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: labels,
        ),
      ),
    );
  }
}
