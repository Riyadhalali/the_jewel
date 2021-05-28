import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_jewel/provider/cart_provider.dart';
import 'package:the_jewel/ui/cart/full_cart.dart';

class Cart extends StatefulWidget {
  static final id = 'cart';
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(
        context); // to have access to the cart provider class
    return Scaffold(
      backgroundColor: Colors.white,
      body: columnElements(),
    );
  }

  //------------------------------Column Elements-------------------------------
  Widget columnElements() {
    return SingleChildScrollView(
      child: SafeArea(
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
            FullCart(),
            FullCart(),
            FullCart(),
            FullCart(),
            FullCart(),
          ],
        ),
      ),
    );
  }
} // end class
