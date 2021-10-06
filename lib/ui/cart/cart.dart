import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_jewel/provider/cart_provider.dart';
import 'package:the_jewel/ui/cart/empty_cart.dart';
import 'package:the_jewel/ui/cart/full_cart.dart';

class Cart extends StatefulWidget {
  static final id = 'cart';
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    // final cartProvider =
    //     Provider.of<CartProvider>(context); // to have access to the cart provider class
    return Provider.of<CartProvider>(context).lst.length == 0
        ? Scaffold(
            backgroundColor: Colors.white,
            body: EmptyCart(),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            body: columnElements(context),
          );
  }

  //------------------------------Column Elements-------------------------------
  Widget columnElements(BuildContext context) {
    final cartProvider =
        Provider.of<CartProvider>(context); // to have access to the cart provider class

    return SafeArea(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/cart/emptycart/cart.jpg',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                //color: Colors.black26,
                height: MediaQuery.of(context).size.height *
                    0.55, // very important to adjust the height
                /// child: ListView.builder(
                /// itemCount: cartProvider.lst.length,
                /// itemBuilder: (BuildContext context, index) {
                ///   return ChangeNotifierProvider.value(
                ///     value: cartProvider.getCartItems.values.toList()[index],
                ///     child: FullCart(
                ///       productId: cartProvider.getCartItems.values.toList()[index].id,
                //       //-> using depenendcy injection
                //       //   productId:
                //       //       cartProvider.getCartItems.values.toList()[index].id,
                //       //   title: cartProvider.getCartItems.values
                //       //       .toList()[index]
                //       //       .title,
                //       //   price: cartProvider.getCartItems.values
                //       //       .toList()[index]
                //       //       .price,
                //       //   quantity: cartProvider.getCartItems.values
                //       //       .toList()[index]
                //       //       .quantity,
                //       //   imageUrl: cartProvider.getCartItems.values
                //       //       .toList()[index]
                //       //       .imageUrl
                ///     ),
                ///   );
                ///  }),
                child: Consumer<CartProvider>(
                  builder: (BuildContext context, cartProvider, child) => ListView.builder(
                    itemCount: cartProvider.lst.length,
                    itemBuilder: (context, index) {
                      return FullCart(
                        productId: cartProvider.lst[index].id.toString(),
                        title: cartProvider.lst[index].title,
                        price: cartProvider.lst[index].price,
                        imageUrl: cartProvider.lst[index].imageUrl,
                        quantity: cartProvider.lst[index].quantity,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Text("Total:" + cartProvider.totalAmount.toString())
        ],
      ),
    );
  }
} // end class
