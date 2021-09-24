import 'package:flutter/material.dart';
import 'package:the_jewel/ui/product_details/product_details.dart';

class GridViewWidget extends StatelessWidget {
  String productId = '';
  String productName = '';
  String productDescription = '';
  String price = '';
  String image = '';
  GridViewWidget(
      {required this.productId,
      required this.productName,
      required this.productDescription,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //-> go to page details
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetails(
              productId: productId,
              productName: productName,
              price: price,
              description: productDescription,
              picture: image,
            ),
          ),
        );
      },
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            children: [
              //---------------------------Image------------------------------------
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.2,
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 0.2,
                        maxHeight: MediaQuery.of(context).size.height * 0.4),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              //   ----------------------Texts----------------------------------------
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      productName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '\$${price.toString()}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style:
                          TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.red),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            productDescription,
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(15),
                            child: Icon(
                              Icons.more_horiz,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//TODO: add the three points in gridview
