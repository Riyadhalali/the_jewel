import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
          ImageBottomBar(),
        ],
      ),
    );
  }

  //-> Image Background for top background of app
  Widget ImageBackground() {
    return Container(
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: Image.asset(
        'assets/privacypolicy/privacypolicy_topbackground.png',
        fit: BoxFit.fill,
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

//------------------------------------------------------------------------------
} //end class
