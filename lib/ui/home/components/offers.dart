import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OffersHeader extends StatefulWidget {
  @override
  _OffersHeaderState createState() => _OffersHeaderState();
}

class _OffersHeaderState extends State<OffersHeader> {
  int index = 0;
  List<Map<String, Object>> images = [
    {
      'categoryName': 'Phones',
      'categoryImagesPath': 'assets/signin/signin_background.png',
    },
    {
      'categoryName': 'Computers',
      'categoryImagesPath': 'assets/signin/signin_background.png',
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getOffers();
  }

//------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    //   getOffers();
    return Column(
      children: [
        OffersText(),
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.2,
          child: ListView.builder(
              itemCount: 8,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Offers();
              }),
        ),
      ],
    );
  }

//------------------------------------------------------------------------------
  Widget OffersText() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "last_offers".tr().toString(),
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
  Widget Offers() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(images[index]['categoryImagesPath'].toString()),
            fit: BoxFit.fill,
          )),
    );
  }

//------------------------------------------------------------------------------

} //------------------------End class-------------------------------------------
//TODO: arrange code in seperate classes and add information of offers under each item
