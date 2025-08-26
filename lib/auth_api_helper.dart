import 'dart:convert';
import 'package:api_task_list2/auth_modal.dart';
import 'package:api_task_list2/weather_modal_class.dart';
import 'package:http/http.dart' as http;

class ProductApiHelper {
  static Future<List<AuthModalClass>?> firstAllKistuApiData() async {
    var response = await http.get(Uri.parse("https://kitsu.io/api/edge/anime?page[limit]=5&page[offset]=0"));
    if (response.statusCode == 200) {
      var resBody = response.body;
      var jsonData = jsonDecode(resBody);
      List<dynamic> jsonBody = jsonData["data"];
      var convertToModal = jsonBody.map((e) => AuthModalClass.jsonModal(e)) .toList();
      return convertToModal;
    }
    return null;
  }


  static Future<WeatherModal?> secondGetAllWeatherApiData() async {
    var response = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=88.7676&lon=77.9899&appid=0e3b9b6d1eb15d7e2e84da8403ab426b"));
    if (response.statusCode == 200) {
      var resBody = response.body;
      var jsonBody = jsonDecode(resBody);
      var convertToModal = WeatherModal.fromJson(jsonBody);
      return convertToModal;
    }
    return null;
  }
}
