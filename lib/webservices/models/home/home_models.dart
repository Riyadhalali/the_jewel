// To parse this JSON data, do
//
//     final getSliderImages = getSliderImagesFromJson(jsonString);

import 'dart:convert';

List<GetSliderImages> getSliderImagesFromJson(String str) =>
    List<GetSliderImages>.from(
        json.decode(str).map((x) => GetSliderImages.fromJson(x)));

String getSliderImagesToJson(List<GetSliderImages> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetSliderImages {
  GetSliderImages({
    required this.id,
    required this.picture,
  });

  int id;
  String picture;

  factory GetSliderImages.fromJson(Map<String, dynamic> json) =>
      GetSliderImages(
        id: json["id"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "picture": picture,
      };
}
