// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:weather_app_bloc/model/branch_model/clouds_model.dart';
import 'package:weather_app_bloc/model/branch_model/main_model.dart';
import 'package:weather_app_bloc/model/branch_model/sys_model.dart';
import 'package:weather_app_bloc/model/branch_model/weather_model.dart';
import 'package:weather_app_bloc/model/branch_model/wind_model.dart';

class ListModel {
  MainModel main;
  List<WeatherModel> weather;
  CloudsModel clouds;
  WindModel wind;
  String dt_txt;
  ListModel({
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.dt_txt,
  });

  ListModel copyWith({
    MainModel? main,
    List<WeatherModel>? weather,
    CloudsModel? clouds,
    WindModel? wind,
    String? dt_txt,
  }) {
    return ListModel(
      main: main ?? this.main,
      weather: weather ?? this.weather,
      clouds: clouds ?? this.clouds,
      wind: wind ?? this.wind,
      dt_txt: dt_txt ?? this.dt_txt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'main': main.toMap(),
      'weather': weather.map((x) => x.toMap()).toList(),
      'clouds': clouds.toMap(),
      'wind': wind.toMap(),
      'dt_txt': dt_txt,
    };
  }

  factory ListModel.fromMap(Map<String, dynamic> map) {
    return ListModel(
      main: MainModel.fromMap(map['main'] as Map<String, dynamic>),
      weather: List<WeatherModel>.from(
        (map['weather'] as List<dynamic>).map<WeatherModel>(
          (x) => WeatherModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      clouds: CloudsModel.fromMap(map['clouds'] as Map<String, dynamic>),
      wind: WindModel.fromMap(map['wind'] as Map<String, dynamic>),
      dt_txt: map['dt_txt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListModel.fromJson(String source) =>
      ListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ListModel(main: $main, weather: $weather, clouds: $clouds, wind: $wind, dt_txt: $dt_txt)';
  }

  @override
  bool operator ==(covariant ListModel other) {
    if (identical(this, other)) return true;

    return other.main == main &&
        listEquals(other.weather, weather) &&
        other.clouds == clouds &&
        other.wind == wind &&
        other.dt_txt == dt_txt;
  }

  @override
  int get hashCode {
    return main.hashCode ^
        weather.hashCode ^
        clouds.hashCode ^
        wind.hashCode ^
        dt_txt.hashCode;
  }
}
