import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/model/weather_model.dart';

class Services {
  String apikey=dotenv.env["API_KEY"]??"NOT FOUND";
   Future<List<WeatherModel>> getApi(String country) async {
    try {
      Response response = await Dio().get(
          "https://api.weatherapi.com/v1/forecast.json?key= $apikey &q=$country&days=3&aqi=no&alerts=no");

      List<WeatherModel> weatherList = [
        WeatherModel.get(response.data, 0),
        WeatherModel.get(response.data, 1),
        WeatherModel.get(response.data, 2),
      ];
      return weatherList;
    } on DioException catch (e) {
      final message =
          e.response?.data['error']['message'] ?? "oops! something whent wrong";
      throw Exception(message);
    } catch (e) {
      throw Exception('somthing whent wrong');
    }
  }
}
