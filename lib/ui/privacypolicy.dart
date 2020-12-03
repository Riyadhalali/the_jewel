import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sizer/sizer.dart';
import 'package:the_jewel/ui/selectcountry.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            StackImages(),
          ],
        ),
      ),
    );
  } // end build

//============================Widgets Tree======================================
  //-> Stack the layout

  Widget StackImages() {
    return Expanded(
      // very important to make stack take all screen height
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ImageForground(),
          ),
          ImageBackground(),
          Positioned(
            top: 25.0.h,
            right: 1.0.w,
            child: PrivavyPolicLogo(),
          ),
          Positioned(
            top: 78.0.h,
            child: AcceptPrivacyPolicyRadioButton(),
          ),
          Positioned(
            top: 30.0.h,
            right: 17.0.w,
            child: PrivacyPolicyText(),
          ),
          ImageBottomBar(), // bar background
          Positioned(
            top: 52.0.h,
            child: PrivacyPolicyAgreement(),
          ), // privacy policy
        ],
      ),
    );
  }
  //============================================================================

  //-> Image Background for top background of app
  Widget ImageBackground() {
    return Container(
      width: double.infinity,
      child: Image.asset(
        'assets/privacypolicy/privacypolicy_topbackground.png',
        fit: BoxFit.cover,
      ),
    );
  }

  //-> image forground
  Widget ImageForground() {
    return Container(
      width: double.infinity,
      child: Image.asset(
        'assets/privacypolicy/privacypolicy_forground.png',
        fit: BoxFit.cover,
      ),
    );
  }

  //-> Bottom Bar
  Widget ImageBottomBar() {
    return Container(
      alignment: Alignment.bottomLeft,
      child: Image.asset(
        'assets/privacypolicy/privacypolicy_bottombar.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }

  //-> Privacy Policy Text
  Widget PrivacyPolicyText() {
    return AutoSizeText(
      "privacypolicy".tr().toString(),
      textAlign: TextAlign.right,
      style: TextStyle(
        fontSize: 20.0.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  //-> Privacy Policy Logo

  Widget PrivavyPolicLogo() {
    return Container(
      child: Image.asset(
        'assets/privacypolicy/privacypolicy_logo.png',
        fit: BoxFit.fill,
      ),
    );
  }

  //-> Check Box

  Widget AcceptPrivacyPolicyRadioButton() {
    return Container(
      alignment: Alignment.bottomLeft,
      width: 90.0.w,
      color: Colors.transparent,
      height: 7.0.h,
      child: CheckboxListTile(
        activeColor: Colors.black87,
        controlAffinity:
            ListTileControlAffinity.leading, // to make checkbox left aligned
        title: Text(
          "Accept Privacy Policy",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 18.0.sp,
            color: Colors.black,
          ),
        ),
        secondary: Icon(Icons.privacy_tip),
        value: _checked,
        onChanged: (bool value) {
          setState(() {
            _checked = value;
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SelectCountry()));

            print(_checked);
          });
        },
      ),
    );
  }

  //-> Privacy Policy agreement text
  Widget PrivacyPolicyAgreement() {
    return Container(
      width: 100.0.w,
      height: 27.0.h,
      padding: EdgeInsets.all(10.0),
      color: Colors.transparent,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Text(
          "Hello Eng. Riyad this is privacy policy of app please be acrefull about everything" +
              "Hello Eng. Riyad this is privacy policy of app please be acrefull about everything." +
              "Hello Eng. Riyad this is privacy policy of app please be acrefull about everything." +
              "Hello Eng. Riyad this is privacy policy of app please be acrefull about everything." +
              "Hello Eng. Riyad this is privacy policy of app please be acrefull about everything.",
          style: TextStyle(fontSize: 20.0.sp),
        ),
      ),
    );
  }

//------------------------------------------------------------------------------

} //end class
