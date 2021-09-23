// To parse this JSON data, do
//
//     final getCategories = getCategoriesFromJson(jsonString);

import 'dart:convert';

List<GetCategories> getCategoriesFromJson(String str) =>
    List<GetCategories>.from(json.decode(str).map((x) => GetCategories.fromJson(x)));

String getCategoriesToJson(List<GetCategories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCategories {
  GetCategories({
    required this.categoryId,
    required this.categoryName,
  });

  int categoryId;
  String categoryName;

  factory GetCategories.fromJson(Map<String, dynamic> json) => GetCategories(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
      };
}
