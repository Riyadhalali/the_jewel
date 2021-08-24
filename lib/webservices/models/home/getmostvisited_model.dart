// To parse this JSON data, do
//
//     final getMostVisited = getMostVisitedFromJson(jsonString);

import 'dart:convert';

List<GetMostVisited> getMostVisitedFromJson(String str) =>
    List<GetMostVisited>.from(json.decode(str).map((x) => GetMostVisited.fromJson(x)));

String getMostVisitedToJson(List<GetMostVisited> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetMostVisited {
  GetMostVisited({
    required this.productId,
    required this.productName,
    required this.descr,
    required this.price,
    required this.picture,
  });

  int productId;
  String productName;
  String descr;
  double price;
  String picture;

  factory GetMostVisited.fromJson(Map<String, dynamic> json) => GetMostVisited(
        productId: json["product_id"],
        productName: json["product_name"],
        descr: json["descr"],
        price: json["price"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "descr": descr,
        "price": price,
        "picture": picture,
      };
}
