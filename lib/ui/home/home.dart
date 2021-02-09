import 'package:flutter/material.dart';
import 'package:the_jewel/components/imageslider.dart';
import 'package:the_jewel/components/textfield.dart';

class Home extends StatefulWidget {
  static final id = 'home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _search = TextEditingController();
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
        Stack(
          children: [
            imageSlider(),
            TextInputField(
              controller_text: _search,
              hint_text: "Search",
              //TODO: Change color to the text input  and add radius
              //TODO: add menu icon and row
              icon_widget: Icon(Icons.search),
            ),
          ],
        ),
      ],
    );
  }

//--------------------------------- Search Box ---------------------------------

//------------------------------------------------------------------------------
} // end class
