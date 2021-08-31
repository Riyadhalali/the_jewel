import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:the_jewel/webservices/api_calls/webservices.dart';
import 'package:the_jewel/webservices/models/products/getdataproductimage.dart';
import 'package:the_jewel/webservices/models/products/getdatarelatedproduct.dart';

class ProductDetails extends StatefulWidget {
  static final id = 'product_id';

  late String? productId;
  late String? productName;
  late String? description;
  late String? price;
  late String? picture;
  late String? categorieId;

  ProductDetails(
      {this.productId,
      this.productName,
      this.description,
      this.price,
      this.picture,
      this.categorieId});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<GetDataProductImage> getDataProductImageList = [];
  List<GetDataRelatedProduct> getDataRelatedProductList = [];

  //-----------------------------Get Other Images for product------------------------------
  Future<List<GetDataProductImage>> getProductImages() async {
    getDataProductImageList = await WebServices.getDataProductImages(widget.productId.toString());
    return getDataProductImageList;
  }

  //---------------------------Get Related products--------------------------------------------
  Future<List<GetDataRelatedProduct>> getRelatedProducts() async {
    getDataRelatedProductList =
        await WebServices.getDataRelatedProducts(widget.categorieId.toString());
    return getDataRelatedProductList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'assets/products_details/product_details_1.png',
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  //-> product image
                  Container(
                    margin: EdgeInsets.all(5),
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: NetworkImage(widget.picture.toString()),
                            fit: BoxFit.cover,
                            scale: 1.0)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Text(
                            widget.productName.toString(),
                            style: TextStyle(color: Colors.black, fontSize: 20.0),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Spacer(),
                        Flexible(
                          flex: 2,
                          child: Text(
                            widget.price.toString(),
                            style: TextStyle(color: Colors.red, fontSize: 20.0),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Divider(
                      color: Colors.amber,
                      thickness: 3.0,
                    ),
                  ),
                  productImagesWidget(),
                  Text('Specifications'.tr().toString()),
                  Divider(),
                  productTextSpecifications(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('add to cart'.tr().toString()),
                            style: ElevatedButton.styleFrom(primary: Colors.amber, elevation: 20),
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('add amount'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.amber,
                              elevation: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text('Related Products'.tr().toString()),
                  relatedProducts(),
                ],
              )
            ],
          ),
        ),
      ),
    );

    //-------------------------------Product Images----------------------------------------
  }

  Widget productImagesWidget() {
    return FutureBuilder(
        future: getProductImages(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            default:
              return Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.15,
                child: ListView.builder(
                    itemCount: getDataProductImageList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return images(getDataProductImageList[index].picture);
                    }),
              );
          }
        });
  }

//--------------------------------------Product Other Images-----------------------------
  Widget images(String image) {
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
                image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover, scale: 1.0)),
          ),
        ],
      ),
    );
  }

  //------------------Text Specifications of Product-------------------------------
  //-> it is better to use future builder because the screen will be build before the api finished

  Widget productTextSpecifications() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.2,
      color: Colors.grey.shade100,
      child: Text(widget.description.toString()),
    );
  }

  //---------------------------Related Products------------------------------------
  //-> related
  Widget relatedProducts() {
    return FutureBuilder(
        future: getRelatedProducts(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:

            default:
              return Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.2,
                child: ListView.builder(
                  itemCount: getDataRelatedProductList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return relatedProductImages(index);
                  },
                ),
              );
          }
        });
  }

  //-----------------------Related Product Images----------------------------------
  Widget relatedProductImages(int index) {
    return Container(
      width: 100,
      // height: 500,
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
                  image: NetworkImage(getDataRelatedProductList[index].picture),
                  fit: BoxFit.cover,
                  scale: 1.0),
            ),
          ),
          Container(
            width: 90,
            child: Column(
              children: [
                Text(
                  getDataRelatedProductList[index].productName,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  getDataRelatedProductList[index].price.toString() + '\$',
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
//------------------------------------------------------------------------------

}
//TODO: 1- make all widgets using Media Query , 2- add support for langauges 3- build the page using api 4- when user tabs on other image the image change
