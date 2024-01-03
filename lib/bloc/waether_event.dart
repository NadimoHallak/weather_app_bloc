// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'waether_bloc.dart';

@immutable
sealed class WeatherEvent {}

class GetCurrentWeatherData extends WeatherEvent {}

class SerchOnCity extends WeatherEvent {
  String city;
  SerchOnCity({
    required this.city,
  });
}
