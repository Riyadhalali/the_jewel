import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_jewel/constant/constants';

class WebServices {
  //--------------------------Login API----------------------------------------
  //-> Post Data to Server
  Future<String> LoginPost(String username, String password) async {
    http.Response response = await http.post(Constants.api_link + 'Login',
        body: {"username": username, "password": password});
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data); // decoding data
      var id = decodedData['customer_id'];
      var message = decodedData['message'];
      return message; // to return message from server
    }
  }

//----------------------Sign Up Page--------------------------------------------
//-> post Data to server for registering user
  Future<String> RegisterPost(
      String username,
      String phone,
      String passworrd,
      String con_password,
      String email,
      String country,
      String city,
      String address,
      String picture) async {
    http.Response response =
        await http.post(Constants.api_link + 'sign_up', body: {
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
  }
//------------------------------------------------------------------------------
} // end class
