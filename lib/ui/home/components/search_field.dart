import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  SearchField({
    Key key,
  }) : super(key: key);
  final textFieldFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        // height: 3.0.h,
        decoration: BoxDecoration(
            color: Colors.white12, borderRadius: BorderRadius.circular(10.0)),
        child: Theme(
          data: new ThemeData(
            primaryColor: Colors.orangeAccent,
          ),
          child: CupertinoTextField(
            focusNode: textFieldFocusNode,
            textAlign: TextAlign.center,
            autofocus: false,
            placeholder: "Search",

            prefix: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Unfocus all focus nodes
                textFieldFocusNode.unfocus();

                // Disable text field's focus node request
                textFieldFocusNode.canRequestFocus = false;

                // Do your stuff
                Scaffold.of(context).openDrawer(); // to open the drawer

                //Enable the text field's focus node request after some delay
                Future.delayed(Duration(milliseconds: 100), () {
                  textFieldFocusNode.canRequestFocus = true;
                });
              },

            ),
            suffix: Icon(Icons.account_circle),

            //****************************Material Design***********************
            // decoration: InputDecoration(
            //     // prefixIcon: IconButton(
            //     //   icon: Icon(Icons.menu),
            //     //   onPressed: () {
            //     //     // textFieldFocusNode
            //     //     //     .unfocus(); // to keep keyboard closed when taping
            //     //     // textFieldFocusNode.canRequestFocus =
            //     //     //     false; // to keep keyboard closed when taping
            //     //     //
            //     //     //    Scaffold.of(context).openDrawer(); // to open the drawer
            //     //   },
            //     // ),
            //     suffixIcon: Icon(Icons.search),
            //     contentPadding: EdgeInsets.symmetric(
            //         vertical:
            //             5), // this line for adjusting the height of the text feild
            //     border: OutlineInputBorder(
            //         borderSide: BorderSide(color: Colors.blue)),
            //     hintText: "Search Products",
            //     focusColor: Colors.white),
            //******************************************************************
          ),
        ),
      ),
    );
  }
}
