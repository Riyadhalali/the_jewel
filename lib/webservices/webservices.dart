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

//-------------------End Login API--------------------------------------------

} // end class
