import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller_text =
      TextEditingController(); // variable for holding controller of text input

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: TextField(
        controller:
            controller_text, // the variable that will contain input user data
        decoration: InputDecoration(
          // hintText: 'Enter u',
          labelText: "signin_password".tr().toString(),
          suffixIcon: Icon(Icons.security),
          //   helperText: "Please put your password",
        ),
      ),
    );
  }
} //end class
