import 'package:flutter/material.dart';

class FullCart extends StatelessWidget {
  static final id = 'full_cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      itemSpecifications(),
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

  //-----------------------------Widget Tree------------------------------------
  //-> Container of the Image product with Box Shadow
  Widget cartItemsWithShadow() {
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
                  'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_78976477/mobile_786_587_png/APPLE-Mac-mini-%282020%29---M1-256GB-8GB',
                ),
                fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }

  //------------------------------------Item name--------------------------------
  //-> item Name and Specifications
  Widget itemSpecifications() {
    return Flexible(
      flex: 4,
      child: Column(
        children: [
          Container(
            // color: Colors.blue,

            child: Text(
              "Intel Core i777777777777777777777777777777777",
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
                    "Price: \$60 ",
                    style: TextStyle(fontSize: 20.0, color: Colors.red),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ],
          ),
          Row(children: [
            Container(
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.blue,
                ),
                onPressed: () {},
              ),
            ),
            Container(
              color: Colors.amber,
              child: Text(
                "1",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
              child: IconButton(
                icon: Icon(
                  Icons.remove,
                  color: Colors.blue,
                ),
                onPressed: () {},
              ),
            ),
          ]),
        ],
      ),
    );
  }

  //----------------------------------Delete Product----------------------------
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
