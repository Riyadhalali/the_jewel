import 'package:flutter/material.dart';
import 'package:the_jewel/components/imageslider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ColumnElements(),
      ),
    );
  } // end build widget

//------------------------------------------------------------------------------
  Widget ColumnElements() {
    return Column(
      children: [
        imageSlider(),
      ],
    );
  }

//--------------------------------- Slider -------------------------------------

//------------------------------------------------------------------------------
} // end class
