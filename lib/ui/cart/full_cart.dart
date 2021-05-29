import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_jewel/models/cart_attr.dart';
import 'package:the_jewel/provider/cart_provider.dart';

class FullCart extends StatefulWidget {
  static final id = 'full_cart';
  final String productId;

  const FullCart({required this.productId});
  // final String title;
  // final double price;
  // final int quantity;
  // final String imageUrl;
  //
  // const FullCart(
  //     {required this.productId,
  //     required this.title,
  //     required this.price,
  //     required this.quantity,
  //     required this.imageUrl});

  @override
  _FullCartState createState() => _FullCartState();
}

class _FullCartState extends State<FullCart> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Flexible(
                  child: Row(
                    children: [
                      cartItemsWithShadow(),
                      itemSpecifications(context),
                      Spacer(),
                      deleteProduct(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cartItemsWithShadow() {
    final cartAttr = Provider.of<CartAttr>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          margin: EdgeInsets.all(2),
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 9,
                  offset: Offset(1, 1)), //(x,y)),
            ],
            image: DecorationImage(
                image: NetworkImage(
                  cartAttr.imageUrl,
                ),
                fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }

  Widget itemSpecifications(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartAttr = Provider.of<CartAttr>(context);
    return Flexible(
      flex: 4,
      child: Column(
        children: [
          Container(
            // color: Colors.blue,

            child: Text(
              cartAttr.title,
              style: TextStyle(
                fontSize: 20.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Flexible(
                child: Container(
                  child: Text(
                    "Price: " + cartAttr.price.toString(),
                    style: TextStyle(fontSize: 20.0, color: Colors.red),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.add_box_rounded,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    cartProvider.addItemByOne(widget.productId);
                  },
                ),
              ),
              Container(
                color: Colors.amber,
                child: Text(
                  cartAttr.quantity.toString(),
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.remove_circle,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    cartProvider.reduceItemByOne(
                      widget.productId,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget deleteProduct() {
    return Flexible(
      flex: 1,
      child: Container(
          height: 100,
          child: IconButton(
            icon: Icon(
              Icons.delete_forever_rounded,
              color: Colors.red,
            ),
            onPressed: () {},
          )),
    );
  }
} //-------------------------------------------End Class--------------------------
