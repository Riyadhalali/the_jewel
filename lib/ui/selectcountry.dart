import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:the_jewel/services/sharedpref.dart';
import 'package:the_jewel/services/snackbarmessage.dart';

import 'signin.dart';

class SelectCountry extends StatefulWidget {
  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  SharedPref sharedPref = new SharedPref();
  snackbarMessage snackbarmessage = new snackbarMessage();
  String return_country;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkSelectedCountry(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print('Selected Country returned by shard:${snapshot.data}');
              return SignIn(); //navigae to another screen
            } else {
              return SafeArea(
                child: Scaffold(
                  body: Builder(builder: (context) => StackImages(context)),
                ),
              );
            }
          }
          //-> any error occurs will show progress indicator
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }); //end future builder
  } // end build widget
//-----------------------------------------------------------------------------

  //-> Check if user already Selected Country
  Future<String> checkSelectedCountry() async {
    String selectedCountry;
    selectedCountry = await sharedPref.LoadData(
        'selectedcountry'); // wait until it returns data
    // print(selectedCountry);

    /*  if (selectedCountry == 'uae') {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
    }
    //check if user already select english
    if (selectedCountry == 'ksa') {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
    }*/
    return selectedCountry;
  }

//--------------------------Stack Widget----------------------------------------
  Widget StackImages(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: SelectCountyForground(),
        ),
        SelectCountryBackground(),
        Positioned(
          top: 60.0.h,
          left: 15.0.w,
          child: SelectedCountrySaudiArabia(context),
        ),
        Positioned(
          top: 60.0.h,
          right: 15.0.w,
          child: SelectedCountryUAE(context),
        ),
      ],
    );
  }

  //----------------------------------------------------------------------------
  //-> top background for select country activity
  Widget SelectCountryBackground() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          child: Image.asset(
            'assets/selectcountry/selectcountry_background.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: -25,
          child: SelectCountryButton(),
        ),
      ],
      overflow: Overflow.visible,
    );
  }

  //-> forground for select country activity
  Widget SelectCountyForground() {
    return Container(
      padding: EdgeInsets.all(0.0),

      // alignment: Alignment.bottomCenter, // to be this bottom alignent in screen
      width: double.infinity,
      child: Image.asset(
        'assets/selectcountry/selectcountry_forground.png',
        fit: BoxFit.cover,
      ),
    );
  }

  //-> select Country
  Widget SelectCountryButton() {
    return Container(
      width: MediaQuery.of(context).size.width, // for being in center in screen
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/selectcountry/selectcountry_button.png',
              fit: BoxFit.fill,
            ),
          ),
          Text(
            'selectcountry'.tr().toString(),
            style: TextStyle(
                fontSize: 10.0.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  //-> Selected Country is Saudi Arabia Country
  Widget SelectedCountrySaudiArabia(BuildContext context) {
    return GestureDetector(
        child: Container(
          height: 30.0.h,
          width: 35.0.w,
          child: Image.asset(
            'assets/selectcountry/selectcountry_saudiarabia.png',
            fit: BoxFit.fill,
          ),
        ),
        onTap: () {
          setState(() {
            sharedPref.setData('selectedcountry',
                'ksa'); //saving selected country to shared pref
            snackbarmessage.displaySnackBar(context, 'KSA Selected');
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => SignIn(),
              ),
            );
          });
        });
  }

//-> Selected Country is UAE
  Widget SelectedCountryUAE(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 30.0.h,
        width: 35.0.w,
        child: Image.asset(
          'assets/selectcountry/selectcountry_uae.png',
          fit: BoxFit.fill,
        ),
      ),
      onTap: () {
        setState(
          () {
            sharedPref.setData('selectedcountry', 'uae');
            snackbarmessage.displaySnackBar(
                context, 'UAE Selected'); // display message
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => SignIn(),
              ),
            );
          },
        );
      },
    );
  }

//------------------------------------------------------------------------------
} // end class
