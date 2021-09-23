import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_jewel/ui/product_details/product_details.dart';
import 'package:the_jewel/webservices/api_calls/api_home.dart';
import 'package:the_jewel/webservices/models/home/mostsales_model.dart';

class MostSales extends StatefulWidget {
  static final id = 'most_sales';
  @override
  _MostSalesState createState() => _MostSalesState();
}

class _MostSalesState extends State<MostSales> {
  int index = 0;

  List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];

  List<GetMostSales> getMostSalesList = [];

  Future<List<GetMostSales>> getMostSales() async {
    getMostSalesList = await ApiHome.getMostSalesProducts();
    return getMostSalesList;
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
              return Text('Error:  ${snapshot.hasError}');
            else {
              return columnElements();
            }
        }
      },
      future: getMostSales(),
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
              itemCount: getMostSalesList.length,
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
            "most_sales".tr().toString(),
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
    return InkWell(
      onTap: () {
        //-> when user press the button do to the details page
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetails(
                  productId: getMostSalesList[index].productId.toString(),

                  productName: getMostSalesList[index].productName.toString(),
                  description: getMostSalesList[index].descr.toString(),
                  price: getMostSalesList[index].price.toString(),
                  picture: getMostSalesList[index].picture.toString(),
                  categorieId: "2", // get it from api
                )));
      },
      child: Container(
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
                    image: NetworkImage(getMostSalesList[index].picture),
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              width: 90,
              child: Column(
                children: [
                  Text(
                    getMostSalesList[index].productName,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    getMostSalesList[index].price.toString() + '\$',
                    style: TextStyle(color: Colors.red),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} //------------------------End class-------------------------------------------
