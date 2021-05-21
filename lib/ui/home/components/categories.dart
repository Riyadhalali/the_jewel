import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:sizer/sizer.dart';

class Categories extends StatefulWidget {
  static final id = 'categories';
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int index = 0;

  List items = [
    Container(
      width: 50,
      height: 50,
    )
  ];
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
    return Column(
      children: [
        //OffersText(),
        //-> container for categories as listview
        // Container(
        //   width: MediaQuery.of(context).size.width * 0.95,
        //   height: MediaQuery.of(context).size.height * 0.21,
        //   child: ListView.builder(
        //       itemCount: imgList.length,
        //       scrollDirection: Axis.horizontal,
        //       itemBuilder: (BuildContext context, int index) {
        //         return Offers(index);
        //       }),
        // ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        gridView(),
      ],
    );
  }

//------------------------------------------------------------------------------
  Widget OffersText() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 10.0),
          child: Text(
            "categories".tr().toString(),
            style: TextStyle(fontSize: 12.0.sp, fontWeight: FontWeight.bold),
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            //TODO: Go to more details page
          },
          child: Text(
            "load_more".tr().toString(),
            style: TextStyle(fontSize: 12.0.sp),
          ),
        ),
      ],
    );
  }

  //------------------------------Offers----------------------------------------
  Widget Offers(int index) {
    return Container(
      width: 100,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                // color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(imgList[index].toString()),
                  fit: BoxFit.fill,
                )),
          ),
          Container(
            width: 90,
            child: Column(
              children: [
                Text(
                  "Apple Watch",
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//------------------------------------------------------------------------------
  Widget gridView() {
    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 2,
        shrinkWrap: true, //to hide error message
        children: <Widget>[
          categoriesImages('assets/home/categories/makeup.svg'),
          categoriesImages('assets/home/categories/men_accessories.svg'),
          categoriesImages('assets/home/categories/woman_accessories.svg'),
          categoriesImages('assets/home/categories/men_perfume.svg'),
          categoriesImages('assets/home/categories/woman_perfume.svg'),
          categoriesImages('assets/home/categories/other.svg'),
        ],
      ),
    );
  }

  //----------------------------------------------------------------------------

  Widget categoriesImages(String svg_asset) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: Svg(svg_asset))),
    );
  }
//-----------------------------------------------------------------------------
}
//TODO: make it gridview and give it names for every categories using listview and retreive it from api
