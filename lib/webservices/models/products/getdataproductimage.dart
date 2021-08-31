// To parse this JSON data, do
//
//     final getDataProductImage = getDataProductImageFromJson(jsonString);
//-> this class to get the other images of product
import 'dart:convert';

List<GetDataProductImage> getDataProductImageFromJson(String str) =>
    List<GetDataProductImage>.from(json.decode(str).map((x) => GetDataProductImage.fromJson(x)));

String getDataProductImageToJson(List<GetDataProductImage> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetDataProductImage {
  GetDataProductImage({
    required this.id,
    required this.picture,
  });

  int id;
  String picture;

  factory GetDataProductImage.fromJson(Map<String, dynamic> json) => GetDataProductImage(
        id: json["id"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "picture": picture,
      };
}
