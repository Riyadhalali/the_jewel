// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.customerId,
    this.message,
    this.username,
  });

  int customerId;
  String message;
  String username;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        customerId: json["customer_id"],
        message: json["message"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "message": message,
        "username": username,
      };
}
