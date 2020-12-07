import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller_text =
      TextEditingController(); // variable for holding controller of text input
  final String hint_text;
  TextInputField({this.hint_text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 36.0,
      padding: EdgeInsets.only(left: 55.0, right: 55.0),
      child: TextField(
        controller:
            controller_text, // the variable that will contain input user data
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFCCCAD2),
          hintText: hint_text.tr().toString(),

          // labelText: "signin_password".tr().toString(),
          suffixIcon: Icon(Icons.security),
          //   helperText: "Please put your password",
        ),
      ),
    );
  }
} //end class
