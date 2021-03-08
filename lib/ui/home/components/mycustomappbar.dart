import 'package:flutter/material.dart';

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
