import 'package:flutter/material.dart';
import 'package:the_jewel/ui/cart.dart';
import 'package:the_jewel/ui/notifications.dart';
import 'package:the_jewel/ui/offers.dart';
import 'package:the_jewel/ui/profile.dart';

import 'file:///C:/Users/RIYAD/AndroidStudioProjects/the_jewel/lib/ui/home/home.dart';

class NavigationBar extends StatefulWidget {
  static final id = 'navigation_main';
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int selectedPage = 0;
  //-> list Pages
  final _pageOptions = [
    Home(),
    Offers(),
    Cart(),
    Notifications(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer), label: 'Offers'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity), label: 'Profile'),
        ],
        currentIndex: selectedPage,
        showUnselectedLabels: true,
        unselectedItemColor: Color(0xFFB1B1B1),
        selectedItemColor: Colors.amber,
        backgroundColor: Color(0xFF707070),
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }
}
