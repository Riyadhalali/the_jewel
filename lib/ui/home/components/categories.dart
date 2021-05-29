import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:provider/provider.dart';
import 'package:the_jewel/provider/cart_provider.dart';

class Categories extends StatefulWidget {
  static final id = 'categories';
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int index = 0;

  List imgList = [
    'assets/home/categories/makeup.png',
    'assets/home/categories/men_accessories.png',
    'assets/home/categories/men_perfume.png',
    'assets/home/categories/other.png',
    'assets/home/categories/woman_accessories.png',
    'assets/home/categories/woman_perfume.png',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

//------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          gridView(context),
        ],
      ),
    );
  }

//------------------------------------------------------------------------------
  Widget gridView(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1,
        shrinkWrap: true, //to hide error message
        children: <Widget>[
          InkWell(
              child: categoriesImages(
                  'assets/home/categories/makeup.svg', 'Makeup'),
              onTap: () => cartProvider.addProduct(
                  "dsdwwe", 5, "intel core i9", "imageUrl")
              //debugPrint(" make up is pressed "),
              ),
          InkWell(
            child: categoriesImages(
                'assets/home/categories/men_accessories.svg',
                'Men Accessories'),
            onTap: () => cartProvider.addProduct(
                "dsdww5555e", 3, "men accessories", "imageUrl"),
          ),
          InkWell(
            child: categoriesImages(
                'assets/home/categories/woman_accessories.svg',
                'Woman Accessories'),
            onTap: () => debugPrint(" woman accessories is pressed "),
          ),
          InkWell(
            child: categoriesImages(
                'assets/home/categories/men_perfume.svg', 'Men Perfume'),
            onTap: () => cartProvider.removeItem("dsdww5555e"),
          ),
          InkWell(
            child: categoriesImages(
                'assets/home/categories/woman_perfume.svg', 'Woman Perfume'),
            onTap: () => cartProvider.reduceItemByOne("dsdwwe"),
          ),
          InkWell(
            child:
                categoriesImages('assets/home/categories/other.svg', 'Other'),
            onTap: () => debugPrint(" other is pressed "),
          ),
        ],
      ),
    );
  }

  //----------------------------------------------------------------------------

  Widget categoriesImages(String svg_asset, String categorie_name) {
    return Column(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: Svg(svg_asset), fit: BoxFit.contain)),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            child: Text(
              categorie_name,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
//-----------------------------------------------------------------------------
}
//TODO: get the api
