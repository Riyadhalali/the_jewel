import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OffersHeader extends StatefulWidget {
  @override
  _OffersHeaderState createState() => _OffersHeaderState();
}

class _OffersHeaderState extends State<OffersHeader> {
  int index = 0;
  // List<Map<String, Object>> images = [
  //   {
  //     'categoryName': 'Phones',
  //     'categoryImagesPath': 'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  //   },
  //   {
  //     'categoryName': 'Computers',
  //     'categoryImagesPath': 'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  //   },
  //   {
  //     'categoryName': 'Labtops',
  //     'categoryImagesPath':'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60'
  //   },
  //   {
  //     'categoryName': 'Desktops',
  //     'categoryImagesPath':'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60'
  //   },
  //   {
  //     'categoryName': 'iphones',
  //     'categoryImagesPath':'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  //   }
  // ];

  List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
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
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Offers(index);
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
  Widget Offers(int index) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage(imgList[index].toString()),
            fit: BoxFit.fill,
          )),
    );
  }

//------------------------------------------------------------------------------

} //------------------------End class-------------------------------------------
//TODO: arrange code in seperate classes and add information of offers under each item
