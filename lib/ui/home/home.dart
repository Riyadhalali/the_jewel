import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
//import 'package:the_jewel/components/imageSliderPro.dart';
import 'package:the_jewel/services/sharedpref.dart';
import 'package:the_jewel/ui/home/components/drawer.dart';
import 'package:the_jewel/ui/home/components/mostsales.dart';
import 'package:the_jewel/ui/home/components/mostvisited.dart';
import 'package:the_jewel/ui/home/components/offers.dart';
import 'package:the_jewel/ui/home/components/search_field.dart';

import 'components/carsouel_slider.dart';

class Home extends StatefulWidget {
  static final id = 'home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? username;
  final _search = TextEditingController();
  SharedPref sharedPref = new SharedPref();

  //-----------------Load username From Shared Pref-----------------------------
  //-> this method to get username data and display it the header
  void getUsernameData() async {
    try {
      username = await sharedPref.LoadData('signin_username');
      print(username.toString());
    } catch (e) {
      throw ('Error getting username from shared preferences in home page');
    }
  }

  //----------------------------init State--------------------------------
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsernameData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(child: ColumnElements()),
        drawer: Drawerpage(
          usernameText: username,
        ),
      ),
    );
  } // end build widget

//------------------------------------------------------------------------------
  Widget ColumnElements() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 1.0.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SearchField(),
          ],
        ),
        SizedBox(
          height: 1.0.h,
        ),
        SizedBox(
          height: 1.0.h,
        ),
        ImageSlider(),
        OffersHeader(),
        MostSales(),
        MostVisited(),
      ],
    );
  }
  //----------------------------------------------------------------------------
} // end main class
