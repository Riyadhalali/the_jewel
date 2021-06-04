import 'package:flutter/material.dart';
import 'package:the_jewel/widgets/gridview.dart';

class Offers extends StatefulWidget {
  static final id = 'offers';
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GridView.count(
          crossAxisSpacing: 4,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          shrinkWrap: true, //to hide error message
          children: List.generate(10, (index) => GridViewWidget()),
        ),
      ),
    );
  }
}

//-------------------------------------------Widget Tree---------------------
//   Widget gridView() {}
// }

//TODO: orgainise code and rename screen to feeds
