// import 'package:http/http.dart' as http;
// import 'package:the_jewel/constant/constants';
// import 'package:the_jewel/webservices/models/home/home_models.dart';
//
// class ApiHome {
//   //------------------------------Offers Images---------------------------------
//   static Future<List<GetOffersModel>> getDataImage() async {
//     try {
//       final response = await http.get(Constants.api_link + 'getdata_image');
//       print('api get image data');
//       if (response.statusCode == 200) {
//         final List<GetOffersModel> getMyServices =
//             getOffersModelFromJson(response.body);
//
//         return getMyServices;
//       }
//     } catch (e) {
//       return List<GetOffersModel>();
//     }
//   }
// //--------------------------------Offers Image 2 -------------------------------
//
//   // Future<String> getDataImage() async {
//   //   final response = await http.get(Constants.api_link + 'getdata_image');
//   //   print('api get image data');
//   //   try {
//   //     if (response.statusCode == 200) {
//   //       var data = jsonDecode(response.body)[0]['picture'];
//   //
//   //       print(data);
//   //       return data;
//   //     }
//   //   } catch (e) {}
//   // }
// //------------------------------------------------------------------------------
// }
