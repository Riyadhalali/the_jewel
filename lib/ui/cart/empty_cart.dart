import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  static final id = 'empty_cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/cart/emptycart/cart.jpg',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Text(
              "yourcartisempty".tr().toString(),
              style: TextStyle(fontSize: 28.0),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text(
                'shopnow'.tr().toString(),
                style: TextStyle(fontSize: 20, color: Colors.amber),
              ),
            )
          ],
        ),
      ),
    );
  }
}
