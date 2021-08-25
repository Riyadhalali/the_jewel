import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_jewel/ui/product_details/product_details.dart';
import 'package:the_jewel/webservices/api_calls/api_home.dart';
import 'package:the_jewel/webservices/models/home/getmostvisited_model.dart';

class MostVisited extends StatefulWidget {
  static final id = 'most_visted';
  @override
  _MostVisitedState createState() => _MostVisitedState();
}

class _MostVisitedState extends State<MostVisited> {
  int index = 0;

  List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];

  List<GetMostVisited> getMostVisitedList = [];

  Future<List<GetMostVisited>> getMostVisited() async {
    getMostVisitedList = await ApiHome.getMostVisitedProducts();
    return getMostVisitedList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          default:
            if (snapshot.hasError)
              return Text('Error +${snapshot.hasError}');
            else {
              return columnElements();
            }
        }
      },
      future: getMostVisited(),
    );
  }

  Widget columnElements() {
    return Column(
      children: [
        OffersText(),
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.21,
          child: ListView.builder(
              itemCount: getMostVisitedList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Offers(index);
              }),
        ),
      ],
    );
  }

  Widget OffersText() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 10.0),
          child: Text(
            "most_visited".tr().toString(),
            style: TextStyle(fontSize: 12.0.sp, fontWeight: FontWeight.bold),
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            //TODO: Go to more details page
            Navigator.pushNamed(context, ProductDetails.id);
          },
          child: Text(
            "load_more".tr().toString(),
            style: TextStyle(fontSize: 12.0.sp),
          ),
        ),
      ],
    );
  }

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
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(getMostVisitedList[index].picture),
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            width: 90,
            child: Column(
              children: [
                Text(
                  getMostVisitedList[index].productName,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  getMostVisitedList[index].price.toString() + '\$',
                  style: TextStyle(color: Colors.red),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} //------------------------End class-------------------------------------------
