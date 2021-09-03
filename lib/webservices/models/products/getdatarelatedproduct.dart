// To parse this JSON data, do
//
//     final getDataRelatedProduct = getDataRelatedProductFromJson(jsonString);

import 'dart:convert';

List<GetDataRelatedProduct> getDataRelatedProductFromJson(String str) =>
    List<GetDataRelatedProduct>.from(
        json.decode(str).map((x) => GetDataRelatedProduct.fromJson(x)));

String getDataRelatedProductToJson(List<GetDataRelatedProduct> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetDataRelatedProduct {
  GetDataRelatedProduct({
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

  factory GetDataRelatedProduct.fromJson(Map<String, dynamic> json) => GetDataRelatedProduct(
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
