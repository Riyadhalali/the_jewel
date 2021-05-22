import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  static final id = 'cart';
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height * 0.45,
              child: Image.asset(
                'assets/cart/emptycart/cart.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Text(
              "Your Cart is Empty !",
              style: TextStyle(fontSize: 28.0),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text(
                'Shop Now!',
                style: TextStyle(fontSize: 20, color: Colors.amber),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//TODO: make the image background
