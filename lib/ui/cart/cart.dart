import 'package:flutter/material.dart';
import 'package:the_jewel/ui/cart/full_cart.dart';

class Cart extends StatefulWidget {
  static final id = 'cart';
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FullCart(),
      // body: ListView.builder(
      //   itemCount: 1,
      //   itemBuilder: (BuildContext context, int index)
      //   {
      //     return FullCart();
      //   },),
    );
  }
} // end class
