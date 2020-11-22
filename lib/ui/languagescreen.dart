import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
      body: Container(
        child: Column(
          children: [
            Container(
              child: Image.asset(
                "assets/languagescreen/languageactivity_background.png",
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 3.0.h,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  child: Image.asset(
                    "assets/languagescreen/chooselanguage.png",
                    fit: BoxFit.fill,
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
              height: 4.0.h,
            ),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                width: 70.0.w,
                height: 7.0.h,
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
              height: 3.0.h,
            ),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                width: 70.0.w,
                height: 7.0.h,
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
      ),
    );
  }
} // end class
