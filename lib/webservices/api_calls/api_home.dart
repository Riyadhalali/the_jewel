import 'package:http/http.dart' as http;
import 'package:the_jewel/constant/constants';
import 'package:the_jewel/webservices/models/home/getlastoffers_model.dart';
import 'package:the_jewel/webservices/models/home/home_models.dart';

class ApiHome {
  //------------------------------Offers Images---------------------------------
  static Future<List<GetSliderImages>> getSliderImage() async {
    var url = Constants.api_link + 'getdata_image';
    List<GetSliderImages> getMySliderImages = [];
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        getMySliderImages = getSliderImagesFromJson(response.body);

        return getMySliderImages;
      }
    } catch (e) {
      return getMySliderImages;
    }
    throw "error in getting image slider data ";
  }

//--------------------------------Get Last Offers Slider----------------------------------
  static Future<List<GetLastOffers>> getLastOffer() async {
    var url = Constants.api_link + 'getdata_offer';
    List<GetLastOffers> getLastOffers = [];
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        getLastOffers = getLastOffersFromJson(response.body);
        print(getLastOffers);
        return getLastOffers;
      }
    } catch (e) {
      return getLastOffers;
    }
    throw 'error in getting last offers home slider ';
  }

//------------------------------------------------------------------------------
}
