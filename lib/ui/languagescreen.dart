import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // background top of screen
          Container(
            height: 375.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/languagescreen/languageactivity_background.png'),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          //-> Select Language text
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 51.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      "assets/languagescreen/chooselanguage.png",
                    ),
                  ),
                ),
              ),
              Text(
                "Select Language",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          //Arabic Language Select
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              width: 238.0,
              height: 48.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                gradient: LinearGradient(
                  begin: Alignment(0.0, -1.0),
                  end: Alignment(0.0, 1.0),
                  colors: [const Color(0xff373737), const Color(0xff252424)],
                  stops: [0.0, 1.0],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x1a000000),
                    offset: Offset(0, 10),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Text(
                "Arabic",
                style: TextStyle(color: Color(0xFFF5AF4B), fontSize: 20.0),
              ),
            ),
            onTap: () {
              print("you clicked my");
            },
          ),
          SizedBox(
            height: 30.0,
          ),
          //English Language Select
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              width: 238.0,
              height: 48.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                gradient: LinearGradient(
                  begin: Alignment(0.0, -1.0),
                  end: Alignment(0.0, 1.0),
                  colors: [const Color(0xff373737), const Color(0xff252424)],
                  stops: [0.0, 1.0],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x1a000000),
                    offset: Offset(0, 10),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Text(
                "English",
                style: TextStyle(color: Color(0xFFF5AF4B), fontSize: 20.0),
              ),
            ),
            onTap: () {
              print("you clicked my");
            },
          ),
        ],
      ),
    );
  }
} // end class
