import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Button extends StatelessWidget {
  final Color colour;
  final String text;

  Button({this.colour, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 197.0,
      height: 52.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: const Color(0xff2d2e39),
      ),
      child: TextButton(
        onPressed: () {
          print('pressed');
        },
        child: Text(
          text.tr().toString(),
          style: TextStyle(color: colour, fontSize: 22.0.sp),
        ),
        style: ButtonStyle(),
      ),
    );
  }
}
