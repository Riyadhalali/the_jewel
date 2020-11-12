import 'dart:async';

import 'package:flutter/material.dart';

import 'languagescreen.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadTimer();
  }

  Future<Timer> LoadTimer() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LanguageScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'images/splashscreen/splashscreenbackground.png'),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          padding: EdgeInsets.all(50.0),
          alignment: Alignment.bottomCenter,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ],
    );
  }
}
