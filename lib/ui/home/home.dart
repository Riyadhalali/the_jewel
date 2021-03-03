import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_jewel/components/imageSliderPro.dart';
import 'package:the_jewel/services/sharedpref.dart';
import 'package:the_jewel/ui/home/components/drawer.dart';
import 'package:the_jewel/ui/home/components/search_field.dart';

class Home extends StatefulWidget {
  static final id = 'home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String username;
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
        imageSliderPro(), // using image slider pro with

        //TabViewOptionsHome(),
        // SizedBox(
        //   height: 150.0,
        // ),
      ],
    );
  }
  //----------------------------------------------------------------------------
} // end main class

//-----------------------------App Bar------------------------------------------
class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //imageSliderPro(), // using image slider pro with
          Positioned(
            // To take AppBar Size only
            top: 10.0,
            left: 50.0,
            right: 50.0,

            child: AppBar(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(90.0),
                ),
              ),
              backgroundColor: Color(0xFFEFEFF3),
              leading: IconButton(
                color: Theme.of(context).primaryColor,
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // to open the drawer
                },
              ),
              primary: false,
              title: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon:
                      Icon(Icons.search, color: Theme.of(context).primaryColor),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
//----------------------------Tab Controller -----------------------------------

//TODO: work with image picker
