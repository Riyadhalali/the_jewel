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
    return Scaffold(
      //resizeToAvoidBottomInset:       false, // to avoid overflow when keyboard opens or just wrap the content with singlechildscrollview

      body: SingleChildScrollView(
        child: Column(
          children: [
            SignInImageBackground(),
            UsernameInput(),
            PasswordInput(),
            RememberMeCheckBox(),
            SignInButton(),
            NoAccountButton(),
            SignInAsGuestButton(),
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
          // height: 40.0.h,
          child: Image.asset(
            'assets/signin/signin_background.png',
            fit: BoxFit.contain,
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
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: TextField(
        decoration: InputDecoration(
            // hintText: 'Enter u',
            labelText: "signin_username".tr().toString(),
            suffixIcon: Icon(Icons.sentiment_satisfied_alt)),
      ),
    );
  }

  //-> password user

  Widget PasswordInput() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: TextField(
        decoration: InputDecoration(
          // hintText: 'Enter u',
          labelText: "signin_password".tr().toString(),
          suffixIcon: Icon(Icons.security),
          //   helperText: "Please put your password",
        ),
      ),
    );
  }

  //-> CheckBox for remember password
  Widget RememberMeCheckBox() {
    return Container(
      //alignment: Alignment.bottomLeft,
      width: double.infinity,
      color: Colors.transparent,
      height: 7.0.h,
      child: CheckboxListTile(
        activeColor: Colors.black87,
        controlAffinity:
            ListTileControlAffinity.leading, // to make checkbox left aligned
        title: Text(
          "Remember Me",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 12.0.sp,
            color: Colors.black,
          ),
        ),
        secondary: Icon(Icons.privacy_tip),
        value: true,
        onChanged: (bool value) {
          setState(() {});
        },
      ),
    );
  }

  //-> Button for Sign in
  Widget SignInButton() {
    return Container(
      width: 170,
      height: 45.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: const Color(0xff2d2e39),
      ),
      child: TextButton(
        onPressed: () {
          print('pressed');
        },
        child: Text(
          "signin_button".tr().toString(),
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(),
      ),
    );
  }

  //-> Don't have account button
  Widget NoAccountButton() {
    return Container(
      height: 40,
      child: TextButton(
        onPressed: () {
          print('pressed');
        },
        child: Text(
          "havenoaccount".tr().toString(),
          style: TextStyle(
            color: Color(0xFF2D2E39),
          ),
        ),
        style: ButtonStyle(),
      ),
    );
  }

//-> Sign in As guest Button
  Widget SignInAsGuestButton() {
    return Container(
      width: 125,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: const Color(0xfffdb952),
      ),
      child: TextButton(
        onPressed: () {
          print('pressed');
        },
        child: Text(
          "signinasguest".tr().toString(),
          style: TextStyle(color: Color(0xFF2D2E39), fontSize: 10.0.sp),
        ),
      ),
    );
  }

//------------------------------------------------------------------------------
} // end class
