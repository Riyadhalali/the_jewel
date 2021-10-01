import 'package:flutter/material.dart';
import 'package:the_jewel/ui/cart/cart.dart';
import 'package:the_jewel/ui/feeds.dart';
import 'package:the_jewel/ui/home/home.dart';
import 'package:the_jewel/ui/notifications.dart';
import 'package:the_jewel/ui/profile.dart';

class NavigationBar extends StatefulWidget {
  static final id = 'navigation_main';
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _pageIndex = 0;
  PageController? _pageController;

  List<Widget> tabPages = [
    Home(),

    //TODO: pass the id for feeds
    Feeds(
      categorieId: '1',
    ),
    Cart(),
    Notifications(),
    Profile(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  void onTabTapped(int index) {
    this
        ._pageController!
        .animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF707070), // color of the
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Offers'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
              BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: 'Profile'),
            ],
            currentIndex: _pageIndex,
            showUnselectedLabels: true,
            unselectedItemColor: Color(0xFFB1B1B1),
            selectedItemColor: Colors.amber,
            backgroundColor: Color(0xFFD8D8D8),
            onTap: onTabTapped,
          ),
        ),
      ),
    );
  }
}

//----------------------------Custom App Bar------------------------------------
/*

 */
