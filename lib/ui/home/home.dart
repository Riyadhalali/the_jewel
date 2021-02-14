import 'package:flutter/material.dart';
import 'package:the_jewel/components/imageslider.dart';

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
        appBar: MyCustomAppBar(
          height: 300,
        ),
        //body: ColumnElements(),
        drawer: Drawer(
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
                          'Username',
                          style: TextStyle(
                              color: Color(0xFFF5AF4B), fontSize: 26.0),
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
                    'حسابي',
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
                  title: Text('الرصيد'),
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
                  title: Text('الطلبات'),
                  onTap: () {
                    //  Navigator.pushNamed(context, SeekService.id); // seek service
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Color(0xFFCFAE8E),
                  ),
                  title: Text('تواصل معنا'),
                  onTap: () {
                    //Navigator.pushNamed(context, MyServices.id);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Color(0xFFCFAE8E),
                  ),
                  title: Text('الإعدادات'),
                  onTap: () {
                    //Navigator.pushNamed(context, MyServices.id);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.emoji_events,
                    color: Color(0xFFCFAE8E),
                  ),
                  title: Text('المسابقات'),
                  onTap: () {
                    //Navigator.pushNamed(context, MyServices.id);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.share,
                    color: Color(0xFFCFAE8E),
                  ),
                  title: Text('مشاركة التطبيق'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  } // end build widget

//------------------------------------------------------------------------------
  Widget ColumnElements() {
    return Column(
      children: [
        Stack(
          children: [
            // TextInputField(
            //   controller_text: _search,
            //   hint_text: "Search",
            //   icon_widget: Icon(Icons.search),
            // ),
          ],
        ),
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
          imageSlider(),
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
//------------------------------------------------------------------------------
//TODO: add locaozation for all screen
//TODO: add localization for drawer
//TODO: load username from shared pref and display it in the drawer
//TODO: work with image picker
