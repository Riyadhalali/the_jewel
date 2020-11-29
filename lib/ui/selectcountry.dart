import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; //
import 'package:sizer/sizer.dart';

class SelectCountry extends StatefulWidget {
  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StackImages(),
    );
  }

//--------------------------Stack Widget----------------------------------------
  Widget StackImages() {
    return Stack(
      children: [
        SelectCountyForground(),
        SelectCountryBackground(),
        Positioned(
          top: 40.0.h,
          child: SelectCountryButton(),
        ),
        Positioned(
          top: 49.0.h,
          left: 10.0.w,
          child: SelectedCountrySaudiArabia(),
        ),
        Positioned(
          bottom: 2.0.h,
          right: 5.0.w,
          child: SelectedCountryUAE(),
        ),
      ],
    );
  }

  //----------------------------------------------------------------------------
  //-> top background for select country activity
  Widget SelectCountryBackground() {
    return Container(
      width: double.infinity,
      child: Image.asset(
        'assets/selectcountry/selectcountry_background.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }

  //-> forground for select country activity
  Widget SelectCountyForground() {
    return Container(
      alignment: Alignment.bottomCenter, // to be this bottom alignent in screen
      width: double.infinity,
      child: Image.asset(
        'assets/selectcountry/selectcountry_forground.png',
        fit: BoxFit.fill,
      ),
    );
  }

  //-> select Country
  Widget SelectCountryButton() {
    return Container(
      width: 100.0.w, // for being in center in screen
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
                fontSize: 15.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  //-> Selected Country is Saudi Arabia Country
  Widget SelectedCountrySaudiArabia() {
    return GestureDetector(
        child: Container(
          width: 100.0.w,
          child: Image.asset(
            'assets/selectcountry/selectcountry_saudiarabia.png',
            fit: BoxFit.fill,
          ),
        ),
        onTap: () {
          setState(() {
            print('You Selected Saudi Arabia');
          });
        });
  }

//-> Selected Country is UAE
  Widget SelectedCountryUAE() {
    return GestureDetector(
      child: Container(
        width: 100.0.w,
        child: Image.asset(
          'assets/selectcountry/selectcountry_uae.png',
          fit: BoxFit.fill,
        ),
      ),
      onTap: () {
        setState(
          () {
            print('You Selected UAE');
            Scaffold.of(context).showSnackBar(SnackBar(content: Text("tap")));
          },
        );
      },
    );
  }

//------------------------------------------------------------------------------
} // end class
