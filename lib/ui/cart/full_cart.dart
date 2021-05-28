import 'package:flutter/material.dart';

class FullCart extends StatefulWidget {
  static final id = 'full_cart';

  @override
  _FullCartState createState() => _FullCartState();
}

class _FullCartState extends State<FullCart> {
  List<String> imageList = [
    'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_78976477/mobile_786_587_png/APPLE-Mac-mini-%282020%29---M1-256GB-8GB',
    'Intel M1',
    '\$60',
  ];

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
                  imageList[0],
                ),
                fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }

  Widget itemSpecifications() {
    return Flexible(
      flex: 4,
      child: Column(
        children: [
          Container(
            // color: Colors.blue,

            child: Text(
              imageList[1],
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
                    "Price: ${imageList[2]}",
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
                  Icons.add_box_rounded,
                  color: Colors.blue,
                ),
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                },
              ),
            ),
            Container(
              color: Colors.amber,
              child: Text(
                quantity.toString(),
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
                  setState(() {
                    quantity--;
                  });
                },
              ),
            ),
          ]),
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
