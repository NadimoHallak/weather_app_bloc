import 'package:dio/dio.dart';

abstract class BaseWeatherServices {
  Dio dio = Dio();
  late Response response;
}

class WeatherService extends BaseWeatherServices {
  getCurrentWeather({String city = "damascus"}) async {
    try {
      response = await dio.get(
          "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=e6324cd99bd6387f7b0c69bc4ac65a61");
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

  getFiveDaysWeather({String city = "damascus"}) async {
    try {
      response = await dio.get(
          "https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=e6324cd99bd6387f7b0c69bc4ac65a61");

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return false;
      }
    } catch (e) {
      print(response.data + "-------------------------");
      return e.toString();
    }
  }
}
