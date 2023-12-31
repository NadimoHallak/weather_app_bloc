// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:weather_app_bloc/model/branch_model/clouds_model.dart';
import 'package:weather_app_bloc/model/branch_model/main_model.dart';
import 'package:weather_app_bloc/model/branch_model/sys_model.dart';
import 'package:weather_app_bloc/model/branch_model/weather_model.dart';
import 'package:weather_app_bloc/model/branch_model/wind_model.dart';

class ListModel {
  num dt;
  MainModel main;
  WeatherModel weather;
  CloudsModel clouds;
  WindModel wind;
  num visibility;
  num pop;
  SysModel sys;
  String dt_txt;
  ListModel({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dt_txt,
  });

  ListModel copyWith({
    num? dt,
    MainModel? main,
    WeatherModel? weather,
    CloudsModel? clouds,
    WindModel? wind,
    num? visibility,
    num? pop,
    SysModel? sys,
    String? dt_txt,
  }) {
    return ListModel(
      dt: dt ?? this.dt,
      main: main ?? this.main,
      weather: weather ?? this.weather,
      clouds: clouds ?? this.clouds,
      wind: wind ?? this.wind,
      visibility: visibility ?? this.visibility,
      pop: pop ?? this.pop,
      sys: sys ?? this.sys,
      dt_txt: dt_txt ?? this.dt_txt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dt': dt,
      'main': main.toMap(),
      'weather': weather.toMap(),
      'clouds': clouds.toMap(),
      'wind': wind.toMap(),
      'visibility': visibility,
      'pop': pop,
      'sys': sys.toMap(),
      'dt_txt': dt_txt,
    };
  }

  factory ListModel.fromMap(Map<String, dynamic> map) {
    return ListModel(
      dt: map['dt'] as num,
      main: MainModel.fromMap(map['main'] as Map<String,dynamic>),
      weather: WeatherModel.fromMap(map['weather'] as Map<String,dynamic>),
      clouds: CloudsModel.fromMap(map['clouds'] as Map<String,dynamic>),
      wind: WindModel.fromMap(map['wind'] as Map<String,dynamic>),
      visibility: map['visibility'] as num,
      pop: map['pop'] as num,
      sys: SysModel.fromMap(map['sys'] as Map<String,dynamic>),
      dt_txt: map['dt_txt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListModel.fromJson(String source) => ListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ListModel(dt: $dt, main: $main, weather: $weather, clouds: $clouds, wind: $wind, visibility: $visibility, pop: $pop, sys: $sys, dt_txt: $dt_txt)';
  }

  @override
  bool operator ==(covariant ListModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.dt == dt &&
      other.main == main &&
      other.weather == weather &&
      other.clouds == clouds &&
      other.wind == wind &&
      other.visibility == visibility &&
      other.pop == pop &&
      other.sys == sys &&
      other.dt_txt == dt_txt;
  }

  @override
  int get hashCode {
    return dt.hashCode ^
      main.hashCode ^
      weather.hashCode ^
      clouds.hashCode ^
      wind.hashCode ^
      visibility.hashCode ^
      pop.hashCode ^
      sys.hashCode ^
      dt_txt.hashCode;
  }
}
