// creating model class for cart

import 'package:flutter/cupertino.dart';

class CartAttr with ChangeNotifier {
  String id;
  String title;
  int quantity;
  double price;
  String imageUrl;

  CartAttr(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price,
      required this.imageUrl});
// mapping values here for database
  factory CartAttr.fromMap(Map<String, dynamic> json) => CartAttr(
      id: json["id"],
      title: json["title"],
      quantity: json["title"],
      price: json["price"],
      imageUrl: json["imageUrl"]);

  Map<String, dynamic> toMap() =>
      {"id": id, "title": title, "quantity": quantity, "price": price, "imageUrl": imageUrl};
}
