import 'package:dio/dio.dart';

abstract class BaseWeatherServices {
  Dio dio = Dio();
  late Response response;
  String currentWeather = '';
  String fiveDaysWeather = '';
}

class weatherService extends BaseWeatherServices {
  getCurrentWeather() async {
    response = await dio.get(currentWeather);
    return response.data;
  }

  getFiveDaysWeather() async {
    response = await dio.get(fiveDaysWeather);
    return response.data;
  }
}
