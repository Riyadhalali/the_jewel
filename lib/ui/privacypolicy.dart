import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sizer/sizer.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
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
            top: 29.0.h,
            right: 1.0.w,
            child: PrivavyPolicLogo(),
          ),
          Positioned(
            top: 32.0.h,
            right: 17.0.w,
            child: PrivacyPolicyText(),
          ),
          ImageBottomBar(),
        ],
      ),
    );
  }

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
    return Text(
      "privacypolicy".tr().toString(),
      textAlign: TextAlign.right,
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget PrivavyPolicLogo() {
    return Container(
      child: Image.asset(
        'assets/privacypolicy/privacypolicy_logo.png',
        fit: BoxFit.fill,
      ),
    );
  }

  //-> Privacy Policy Logo

//------------------------------------------------------------------------------
} //end class
