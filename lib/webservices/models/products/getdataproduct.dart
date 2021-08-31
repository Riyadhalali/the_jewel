// To parse this JSON data, do
//
//     final getdataProduct = getdataProductFromJson(jsonString);

import 'dart:convert';

List<GetdataProduct> getdataProductFromJson(String str) =>
    List<GetdataProduct>.from(json.decode(str).map((x) => GetdataProduct.fromJson(x)));

String getdataProductToJson(List<GetdataProduct> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetdataProduct {
  GetdataProduct({
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

  factory GetdataProduct.fromJson(Map<String, dynamic> json) => GetdataProduct(
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
