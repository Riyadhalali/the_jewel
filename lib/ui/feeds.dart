import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:the_jewel/services/showtoast.dart';
import 'package:the_jewel/webservices/api_calls/webservices.dart';
import 'package:the_jewel/webservices/models/products/getdataproduct.dart';
import 'package:the_jewel/widgets/gridview.dart';

class Feeds extends StatefulWidget {
  static final id = 'offers';
  final String? categorieId;

  Feeds({this.categorieId});
  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  List<GetdataProduct> getDataProductList = [];
  ShowToast showToast = new ShowToast();

  //-----------------------------------Get Data Product---------------------------------------
  Future<List<GetdataProduct>> getDataProduct() async {
    getDataProductList = await WebServices.getDataProducts(widget.categorieId.toString());
    return getDataProductList;
  }
  //------------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE0E0E0),
        // body: GridView.count(
        //   crossAxisSpacing: 4,
        //   mainAxisSpacing: 10,
        //   crossAxisCount: 2,
        //   childAspectRatio: 2 / 3,
        //   shrinkWrap: true, //to hide error message
        //   children: List.generate(10, (index) => GridViewWidget()),
        // ),

//-> if we want to use staggered GridView
        body: FutureBuilder(
          future: getDataProduct(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );

              default:
                if (snapshot.hasError)
                  showToast.showToast(snapshot.error.toString());
                else
                  return getDataProductList.isEmpty
                      ? Center(child: Text("sorry no data available".tr().toString()))
                      : StaggeredGridView.countBuilder(
                          //padding: 1,
                          crossAxisCount: 6,
                          itemCount: getDataProductList.length,
                          itemBuilder: (BuildContext context, int index) => GridViewWidget(
                            productId: getDataProductList[index].productId.toString(),
                            productName: getDataProductList[index].productName.toString(),
                            productDescription: getDataProductList[index].descr.toString(),
                            price: getDataProductList[index].price.toString(),
                            image: getDataProductList[index].picture.toString(),
                          ),
                          staggeredTileBuilder: (int index) =>
                              new StaggeredTile.count(3, index.isEven ? 4 : 5),
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 6.0,
                        );
                //-> in case there is  data and there is no error but the future complete with no data and there is no error
                return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
//--------------------------------------------------------------------------------------
