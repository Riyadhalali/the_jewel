import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SignInImageBackground(),
            SizedBox(
              height: 2.0.h,
            ),
            UsernameTextView(), // i comment it because i already make it in usernameinput
            UsernameInput(),
          ],
        ),
      ),
    );
  } // end build

//--------------------------Widget Tree----------------------------------------
  //-> sign in background
  Widget SignInImageBackground() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          child: Image.asset(
            'assets/signin/signin_background.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 20,
          child:
              SignInIcon(), // stacking icon in the botto of the background at the right postion
        ),
      ],
    );
  }

  //-> Widget Sign in user Icon
  Widget SignInIcon() {
    return FittedBox(
      fit: BoxFit.contain,
      child: Image.asset(
        'assets/signin/signin_icon.png',
        fit: BoxFit.contain,
      ),
    );
  }

  //-> Text view of username

  Widget UsernameTextView() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10.0),
      child: Text(
        "signin_username".tr().toString(),
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 16.0.sp,
          color: Color(0xFF707070),
        ),
      ),
    );
  }

  //-> Username Input

  Widget UsernameInput() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Enter a search term',
          labelText: "username",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
//------------------------------------------------------------------------------
} // end class
