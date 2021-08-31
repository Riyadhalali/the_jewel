import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_jewel/constant/constants';
import 'package:the_jewel/webservices/models/login/Login.dart';
import 'package:the_jewel/webservices/models/products/getdataproduct.dart';
import 'package:the_jewel/webservices/models/products/getdataproductimage.dart';

class WebServices {
  //--------------------------Login API----------------------------------------
  //-> Post Data to Server
  Future<Login> LoginPost(String username, String password) async {
    var url = Constants.api_link + 'Login';
    try {
      http.Response response =
          await http.post(Uri.parse(url), body: {"username": username, "password": password});
      if (response.statusCode == 200) {
        final Login getLoginData = loginFromJson(response.body);
        return getLoginData;
      }
    } catch (e) {
      throw 'Error in getting data from login api';
    }
    throw "Error in getting data from login api";
  }

//----------------------Sign Up Page--------------------------------------------
//-> post Data to server for registering user
  Future<String?> RegisterPost(String username, String phone, String passworrd, String con_password,
      String email, String country, String city, String address, String picture) async {
    var url = Constants.api_link + 'sign_up';
    try {
      http.Response response = await http.post(Uri.parse(url), body: {
        "username": username,
        "phone": phone,
        "password": passworrd,
        "conf_password": con_password,
        "email": email,
        "country": country,
        "city": city,
        "address": address,
        "picture": picture
      });
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data); // decoding data
        var id = decodedData['customer_id'];
        var message = decodedData['message'];
        print(message);
        return message; // to return message from server
      }
    } catch (e) {
      throw "Error in Registering api";
    }
  }

  //------------------------------------Get Data Products---------------------------------------
//-> this api will get all products related to specific categorie so i must post an id for categories
  static Future<List<GetdataProduct>> getDataProducts(String categorieId) async {
    var url = Constants.api_link + 'getdata_product';
    List<GetdataProduct> getDataProduct = [];
    try {
      final response = await http.post(Uri.parse(url), body: {"category_id": categorieId});
      if (response.statusCode == 200) {
        getDataProduct = getdataProductFromJson(response.body);
        return getDataProduct;
      }
    } catch (e) {
      throw e;
    }
    throw 'error in getting data product';
  }

//------------------------- Get Product Other Images---------------------------------
//-> get the other product images

  static Future<List<GetDataProductImage>> getDataProductImages(String productId) async {
    var url = Constants.api_link + 'getdata_product_image';
    List<GetDataProductImage> getDataProductImage = [];
    print("getting product images ...");
    try {
      final response = await http.post(Uri.parse(url), body: {"product_id": productId});

      print(response.body);
      if (response.statusCode == 200) {
        getDataProductImage = getDataProductImageFromJson(response.body);
        return getDataProductImage;
      }
    } catch (e) {
      throw e;
    }
    throw 'error in getting data product other images';
  }
//--------------------------------------Get Related Products---------------------------

} // end class
