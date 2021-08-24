// To parse this JSON data, do
//
//     final getLastOffers = getLastOffersFromJson(jsonString);

import 'dart:convert';

List<GetLastOffers> getLastOffersFromJson(String str) =>
    List<GetLastOffers>.from(json.decode(str).map((x) => GetLastOffers.fromJson(x)));

String getLastOffersToJson(List<GetLastOffers> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetLastOffers {
  GetLastOffers({
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

  factory GetLastOffers.fromJson(Map<String, dynamic> json) => GetLastOffers(
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
