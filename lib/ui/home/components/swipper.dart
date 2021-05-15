import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

//-> Swipper Class just like and image slider
class SwipperCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.95,
      child: Swiper(
        itemCount: 10,
        autoplay: true,
        // viewportFraction: 0.9,
        scale: 0.95,

        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              child: Image.network(
                'http://via.placeholder.com/288x188',
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }
}
