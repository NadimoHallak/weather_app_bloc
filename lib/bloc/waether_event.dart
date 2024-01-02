part of 'waether_bloc.dart';

@immutable
sealed class WeatherEvent {}

class GetCurrentWeatherData extends WeatherEvent {}

class GetFiveOther extends WeatherEvent {}
