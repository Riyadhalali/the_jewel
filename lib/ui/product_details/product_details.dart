import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  static final id = 'product_details';

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                Container(
                  margin: EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: NetworkImage('http://87.98.187.79/picture/2.jpg'),
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
                          "Man Watchh",
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Spacer(),
                      Flexible(
                        flex: 2,
                        child: Text(
                          "200.0 \$",
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
                Text('Specifications'),
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
                          child: Text('add to cart'),
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
                Text('Related Producs'),
                relatedProducts(),
              ],
            )
          ],
        ),
      ),
    );

    //-------------------------------Product Images----------------------------------------
  }

  Widget productImagesWidget() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return images();
          }),
    );
  }

//----------------------------------------------
  Widget images() {
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
                image:
                    DecorationImage(image: NetworkImage('hello'), fit: BoxFit.cover, scale: 1.0)),
          ),
        ],
      ),
    );
  }

  //------------------Text Specifications of Product-------------------------------
  Widget productTextSpecifications() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.2,
      color: Colors.grey.shade100,
      child: Text(
          "هذا المنتج للبيع بسعر مغري جداً حيث يتضمن لوحة مفاتيح وأرقام وراوتر بالإضافة أنه يدعم عدة لغات منها العربي والانكليزي"),
    );
  }

  //---------------------------Related Products------------------------------------
  Widget relatedProducts() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return relatedProductImages();
          }),
    );
  }

  //-----------------------Related Product Images----------------------------------
  Widget relatedProductImages() {
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
                image:
                    DecorationImage(image: NetworkImage('hello'), fit: BoxFit.cover, scale: 1.0)),
          ),
        ],
      ),
    );
  }
//------------------------------------------------------------------------------

}
//TODO: 1- make all widgets using Media Query , 2- add support for langauges 3- build the page using api
