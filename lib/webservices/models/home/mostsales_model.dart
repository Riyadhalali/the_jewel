// To parse this JSON data, do
//
//     final getMostSales = getMostSalesFromJson(jsonString);

import 'dart:convert';

List<GetMostSales> getMostSalesFromJson(String str) =>
    List<GetMostSales>.from(json.decode(str).map((x) => GetMostSales.fromJson(x)));

String getMostSalesToJson(List<GetMostSales> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetMostSales {
  GetMostSales({
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

  factory GetMostSales.fromJson(Map<String, dynamic> json) => GetMostSales(
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
