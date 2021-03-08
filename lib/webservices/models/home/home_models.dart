//------------------------------------------------------------------------------
import 'dart:convert';

List<GetOffersModel> getOffersModelFromJson(String str) =>
    List<GetOffersModel>.from(
        json.decode(str).map((x) => GetOffersModel.fromJson(x)));

String getOffersModelToJson(List<GetOffersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetOffersModel {
  GetOffersModel({
    this.id,
    this.picture,
  });

  int id;
  String picture;

  factory GetOffersModel.fromJson(Map<String, dynamic> json) => GetOffersModel(
        id: json["id"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "picture": picture,
      };
}
//------------------------------------------------------------------------------
