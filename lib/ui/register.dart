import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_jewel/components/button.dart';
import 'package:the_jewel/components/textfield.dart';

class RegisterActivity extends StatefulWidget {
  @override
  _RegisterActivityState createState() => _RegisterActivityState();
}

class _RegisterActivityState extends State<RegisterActivity> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            RegisterBackgroundImage(),
            ColumnElements(),
          ],
        ),
      ),
    );
  } // end build

//-----------------------------Widget Tree--------------------------------------
  Widget ColumnElements() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 4.5.h,
        ),
        UserImage(),
        SizedBox(
          height: 7.0.h,
        ),
        Button(
          colour: Colors.white,
          text: "register", //pass key from json file
        ),
        TextInputField(),
      ],
    );
  }

//------------------------------------------------------------------------------
//-> Background Register
  Widget RegisterBackgroundImage() {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: Image.asset(
          'assets/register/register_background.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

//------------------------------------------------------------------------------
  Widget UserImage() {
    return GestureDetector(
        child: Container(
          height: 30.0.h,
          alignment: Alignment.center,
          child: Image.asset(
            'assets/register/register_userimage.png',
            fit: BoxFit.fill,
          ),
        ),
        onTap: () {
          setState(() {});
        });
  }

  //----------------------------------------------------------------------------

  //-----------------------------------------------------------------------------
} //end class
