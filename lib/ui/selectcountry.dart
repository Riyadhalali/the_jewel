import 'package:flutter/material.dart'; //

class SelectCountry extends StatefulWidget {
  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StackImages(),
    );
  }

//--------------------------Stack Widget----------------------------------------
  Widget StackImages() {
    return Stack(
      children: [
        SelectCountryBackground(),
      ],
    );
  }

  //----------------------------------------------------------------------------
  Widget SelectCountryBackground() {
    return Container(
      width: double.infinity,
      child: Image.asset(
        'assets/selectcountry/selectcountry_background.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }

//------------------------------------------------------------------------------
} // end class
