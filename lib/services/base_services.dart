import 'package:dio/dio.dart';

abstract class BaseWeatherServices {
  Dio dio = Dio();
  late Response response;
}

class WeatherService extends BaseWeatherServices {
  getCurrentWeather() async {
    try {
      response = await dio.get(
          "https://api.openweathermap.org/data/2.5/weather?q=aleppo&appid=e6324cd99bd6387f7b0c69bc4ac65a61");
      print(response.data);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return false;
      }
    } catch (e) {
      return 'No Enternet';
    }
  }

  getFiveDaysWeather() async {
    try {
      response = await dio.get(
          "api.openweathermap.org/data/2.5/forecast?q=damascus&appid=e6324cd99bd6387f7b0c69bc4ac65a61");
      print(response.data);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return false;
      }
    } catch (e) {
      return 'No Enternet';
    }
  }
}
