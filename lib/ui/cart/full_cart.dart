import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_jewel/provider/cart_provider.dart';

class FullCart extends StatefulWidget {
  static final id = 'full_cart';
  final String productId;

  //const FullCart({required this.productId});
  final String title;
  final double price;
  final int quantity;
  final String imageUrl;

  const FullCart(
      {required this.productId,
      required this.title,
      required this.price,
      required this.quantity,
      required this.imageUrl});

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
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Row(
                  children: [
                    cartItemsWithShadow(context),
                    itemSpecifications(context),
                    Spacer(),
                    deleteProduct(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cartItemsWithShadow(BuildContext context) {
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
                  widget.imageUrl,
                ),
                fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }

  Widget itemSpecifications(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Flexible(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // color: Colors.blue,

            child: Text(
              widget.title,
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
                flex: 1,
                child: Container(
                  child: Text(
                    "Price: " + widget.price.toString(),
                    style: TextStyle(fontSize: 20.0, color: Colors.red),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ],
          ),
          Container(
            //child: Text("Sub price: " + cartProvider.getItemPrice().toString()),
            child: Text("Sub price: "),
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
                    cartProvider.addItemQuantity(
                        widget.productId, widget.price, widget.title, widget.imageUrl);
                  },
                ),
              ),
              Container(
                color: Colors.amber,
                child: Text(
                  widget.quantity.toString(),
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
                    cartProvider.reduceItemQuantity(
                        widget.productId, widget.price, widget.title, widget.imageUrl);
                    // update data in database
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
    final cartProvider = Provider.of<CartProvider>(context);
    return Flexible(
      flex: 1,
      child: Container(
          height: 100,
          child: IconButton(
            icon: Icon(
              Icons.delete_forever_rounded,
              color: Colors.red,
            ),
            onPressed: () {
              setState(() {
                cartProvider.removeItem(widget.productId);
              });
            },
          )),
    );
  }
} //-------------------------------------------End Class--------------------------
//TODO: don't allow negative prices, and activate the delete button.
//TODO: handle errors
