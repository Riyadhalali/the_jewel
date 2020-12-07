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
    return SingleChildScrollView(
      child: Column(
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
          SizedBox(
            height: 2.0.h,
          ),
          TextInputField(
            hint_text: "signin_username",
          ), // username
          SizedBox(
            height: 2.0.h,
          ),
          TextInputField(
            hint_text: "signin_password",
          ), // password
          SizedBox(
            height: 2.0.h,
          ),
          TextInputField(
            hint_text: "confirmpassword",
          ), // confirm password
          SizedBox(
            height: 2.0.h,
          ),
          TextInputField(
            hint_text: "email",
          ), // Email
          SizedBox(
            height: 2.0.h,
          ),
          TextInputField(
            hint_text: "phonenumber",
          ), //phone number
          SizedBox(
            height: 2.0.h,
          ),
          TextInputField(
            hint_text: "city",
          ), // city
          SizedBox(
            height: 2.0.h,
          ),
          TextInputField(
            hint_text: "address",
          ), // address
          SizedBox(
            height: 2.0.h,
          ),
        ],
      ),
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
