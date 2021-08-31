import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:the_jewel/provider/cart_provider.dart';
//import 'package:the_jewel/components/imageSliderPro.dart';
import 'package:the_jewel/services/sharedpref.dart';
import 'package:the_jewel/ui/home/components/carsouel_slider.dart';
import 'package:the_jewel/ui/home/components/categories.dart';
import 'package:the_jewel/ui/home/components/drawer.dart';
import 'package:the_jewel/ui/home/components/mostsales.dart';
import 'package:the_jewel/ui/home/components/mostvisited.dart';
import 'package:the_jewel/ui/home/components/offers.dart';
import 'package:the_jewel/ui/home/components/search_field.dart';
import 'package:the_jewel/webservices/api_calls/api_home.dart';
import 'package:the_jewel/webservices/api_calls/webservices.dart';
import 'package:the_jewel/webservices/models/home/home_models.dart';
import 'package:the_jewel/webservices/models/products/getdataproduct.dart';

class Home extends StatefulWidget {
  static final id = 'home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? username;
  final _search = TextEditingController();
  SharedPref sharedPref = new SharedPref();
  List<GetSliderImages> getImageSliderList = [];

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

  //--------------------------------------------------------------------
  Future<List<GetSliderImages>> getImageSliderData() async {
    getImageSliderList = await ApiHome.getSliderImage();
    print(getImageSliderList[0].picture);
    return getImageSliderList;
  }

  //---------------------------------------get Data product------------------------------
  List<GetdataProduct> getDataProductList = [];

  //-> get data product related to the categorie required by user
  Future<List<GetdataProduct>> getdataproduct() async {
    getDataProductList = await WebServices.getDataProducts('1');
    print(getDataProductList[1].productName);
    return getDataProductList;
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
    final cartProvider =
        Provider.of<CartProvider>(context); // to have access to the cart provider class
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
        OffersHeader(), // last offers
        MostSales(),
        MostVisited(),
        Categories(),
      ],
    );
  }
  //----------------------------------------------------------------------------
} // end main class
