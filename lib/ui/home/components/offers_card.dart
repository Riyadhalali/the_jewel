import 'package:flutter/material.dart';

class OffersCard extends StatelessWidget {
  final String imageURL;
  OffersCard({this.imageURL}); // pass the image
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      color: Colors.blue,
      height: 150.0,
      child: Card(
        child: Image.network(imageURL),
      ),
    );
  }
}
