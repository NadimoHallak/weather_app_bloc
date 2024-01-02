// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'waether_bloc.dart';

@immutable
sealed class WeatherState {}

final class WaetherInitial extends WeatherState {}

class SuccessGetingCurrentWeatherData extends WeatherState {
  CurrentWeatherModel data;
  FiveDaysModel data1;
  SuccessGetingCurrentWeatherData({
    required this.data,
    required this.data1,
  });
 
}



class LoadingWeatherData extends WeatherState {}

class ErrorWeatherData extends WeatherState {}

class NoEnternetWeatherData extends WeatherState {}
