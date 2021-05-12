import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Drawerpage extends StatelessWidget {
  final String? usernameText;
  Drawerpage({this.usernameText});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFE9ECF1), // to get the drawer color
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/home/drawer/drawer_home.png',
                    ),
                    fit: BoxFit.cover),
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      backgroundImage: AssetImage(
                        'assets/splashscreen/logo.png',
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight + Alignment(-0.5, 0),
                    child: Text(
                      usernameText.toString(), // getting username from shared
                      style:
                          TextStyle(color: Color(0xFFF5AF4B), fontSize: 26.0),
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Color(0xFFCFAE8E),
              ),
              title: Text(
                'myaccount'.tr().toString(),
              ),
              onTap: () {
                //   Navigator.pushNamed(context, Search.id);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.monetization_on,
                color: Color(0xFFCFAE8E),
              ),
              title: Text('balance'.tr().toString()),
              onTap: () {
                // Navigator.pushNamed(
                //     context, AddSeekService.id); // add service
              },
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_cart,
                color: Color(0xFFCFAE8E),
              ),
              title: Text('orders'.tr().toString()),
              onTap: () {
                //  Navigator.pushNamed(context, SeekService.id); // seek service
              },
            ),
            ListTile(
              leading: Icon(
                Icons.phone,
                color: Color(0xFFCFAE8E),
              ),
              title: Text('contactus'.tr().toString()),
              onTap: () {
                //Navigator.pushNamed(context, MyServices.id);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Color(0xFFCFAE8E),
              ),
              title: Text('settings'.tr().toString()),
              onTap: () {
                //Navigator.pushNamed(context, MyServices.id);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.emoji_events,
                color: Color(0xFFCFAE8E),
              ),
              title: Text('competitions'.tr().toString()),
              onTap: () {
                //Navigator.pushNamed(context, MyServices.id);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.share,
                color: Color(0xFFCFAE8E),
              ),
              title: Text('shareapp'.tr().toString()),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
