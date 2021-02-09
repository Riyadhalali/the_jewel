import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_jewel/services/sharedpref.dart';

import 'file:///C:/Users/RIYAD/AndroidStudioProjects/the_jewel/lib/ui/privacypolicy/privacypolicy.dart';

class LanguageScreen extends StatefulWidget {
  static final id = 'langugae_screen';
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int counter = 0;
  SharedPref sharedPref = SharedPref();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
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
                    'selectlanguage'.tr().toString(),
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
                      colors: [
                        const Color(0xff373737),
                        const Color(0xff252424)
                      ],
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
                    "العربية",
                    style: TextStyle(color: Color(0xFFF5AF4B), fontSize: 20.0),
                  ),
                ),
                onTap: () {
                  setState(() {
                    EasyLocalization.of(context).locale =
                        Locale("ar"); // set language to arabic
                    sharedPref.setData(
                        'selectedlanguage', 'ar'); // save it to sharedpref

                    Navigator.pushNamed(context,
                        PrivacyPolicy.id); // go to the privacy policy page
                  });
                  ;
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
                      colors: [
                        const Color(0xff373737),
                        const Color(0xff252424)
                      ],
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
                  setState(() {
                    EasyLocalization.of(context).locale =
                        Locale("en"); // set language to English
                    sharedPref.setData('selectedlanguage', 'en');
                    Navigator.pushNamed(context,
                        PrivacyPolicy.id); // go to the privacy policy page
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );

    //----------------------------------------------------------------------
  }
}
