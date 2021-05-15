import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
/*  final String key;
  final String data;
// create constructor
  SharedPref(this.key, this.data);*/

  //-> function for saving strings
  setData(String key, String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(key, data);
    print(key);
    print(data);
  }

  //-> function for loading data from shared preferences
  Future<String> LoadData(String key) async {
    String returnedData;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    returnedData = sharedPreferences.getString(key).toString();
    return returnedData;
  }
} // end class
