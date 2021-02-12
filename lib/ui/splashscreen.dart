import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_jewel/services/sharedpref.dart';
import 'package:the_jewel/ui/countryselect/selectcountry.dart';
import 'package:the_jewel/ui/navigation.dart';
import 'package:the_jewel/ui/privacypolicy/privacypolicy.dart';
import 'package:the_jewel/ui/signin/signin.dart';

import 'languageselect/languagescreen.dart';

class StartScreen extends StatefulWidget {
  static final id = 'splash_screen';
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  SharedPref sharedPref = new SharedPref();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadTimer();
  }

  //------------------------Check Privacy Policy--------------------------------

  Future<Timer> LoadTimer() async {
    return new Timer(Duration(seconds: 2), onDoneLoading);
  }

  //-> this function will check if user already selected all startup programs features.
  onDoneLoading() async {
    String userId;
    String selected_lang;
    String privacypolicy;
    String selectCountry;
    userId = await sharedPref.LoadData('userID');
    selected_lang = await sharedPref.LoadData('selectedlanguage');
    privacypolicy = await sharedPref.LoadData('privacypolicystate');
    selectCountry = await sharedPref.LoadData('selectedcountry');

    if ((selected_lang == 'en' ||
            selected_lang ==
                'ar') && // first level check language selection and privacy policy and user id selection and select country
        (privacypolicy == 'privacypolicyaccepted' &&
            selectCountry != null &&
            userId != null)) {
      Navigator.pushNamed(context, NavigationBar.id);
    } else if ((selected_lang == 'en' ||
            selected_lang ==
                'ar') && // second level check select language and privacy policy
        (privacypolicy == 'privacypolicyaccepted' &&
            selectCountry != null &&
            userId == null)) {
      Navigator.pushNamed(context, SignIn.id);
    } else if ((selected_lang == 'en' ||
            selected_lang ==
                'ar') && // second level check select language and privacy policy
        (privacypolicy == 'privacypolicyaccepted' &&
            selectCountry == null &&
            userId == null)) {
      Navigator.pushNamed(context, SelectCountry.id);
    } else if ((selected_lang == 'en' ||
            selected_lang == 'ar') && // third level check select language
        (privacypolicy == null && selectCountry == null && userId == null)) {
      Navigator.pushNamed(context, PrivacyPolicy.id);
    } else {
      Navigator.pushNamed(
          context, LanguageScreen.id); // return to the first path
    }
  }

  //----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/splashscreen/splashscreenbackground.png'),
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
