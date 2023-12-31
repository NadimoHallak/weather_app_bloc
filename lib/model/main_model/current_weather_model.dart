// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:weather_app_bloc/model/branch_model/clouds_model.dart';
import 'package:weather_app_bloc/model/branch_model/coord_model.dart';
import 'package:weather_app_bloc/model/branch_model/main_model.dart';
import 'package:weather_app_bloc/model/branch_model/sys_model.dart';
import 'package:weather_app_bloc/model/branch_model/weather_model.dart';
import 'package:weather_app_bloc/model/branch_model/wind_model.dart';

class CurrentWeatherModel {
  CoordModel coord;
  WeatherModel weather;
  String base;
  MainModel main;
  num visibility;
  WindModel wind;
  CloudsModel clouds;
  num dt;
  SysModel sys;
  num timezone;
  num id;
  String name;
  num cod;
  CurrentWeatherModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  CurrentWeatherModel copyWith({
    CoordModel? coord,
    WeatherModel? weather,
    String? base,
    MainModel? main,
    num? visibility,
    WindModel? wind,
    CloudsModel? clouds,
    num? dt,
    SysModel? sys,
    num? timezone,
    num? id,
    String? name,
    num? cod,
  }) {
    return CurrentWeatherModel(
      coord: coord ?? this.coord,
      weather: weather ?? this.weather,
      base: base ?? this.base,
      main: main ?? this.main,
      visibility: visibility ?? this.visibility,
      wind: wind ?? this.wind,
      clouds: clouds ?? this.clouds,
      dt: dt ?? this.dt,
      sys: sys ?? this.sys,
      timezone: timezone ?? this.timezone,
      id: id ?? this.id,
      name: name ?? this.name,
      cod: cod ?? this.cod,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coord': coord.toMap(),
      'weather': weather.toMap(),
      'base': base,
      'main': main.toMap(),
      'visibility': visibility,
      'wind': wind.toMap(),
      'clouds': clouds.toMap(),
      'dt': dt,
      'sys': sys.toMap(),
      'timezone': timezone,
      'id': id,
      'name': name,
      'cod': cod,
    };
  }

  factory CurrentWeatherModel.fromMap(Map<String, dynamic> map) {
    return CurrentWeatherModel(
      coord: CoordModel.fromMap(map['coord'] as Map<String,dynamic>),
      weather: WeatherModel.fromMap(map['weather'] as Map<String,dynamic>),
      base: map['base'] as String,
      main: MainModel.fromMap(map['main'] as Map<String,dynamic>),
      visibility: map['visibility'] as num,
      wind: WindModel.fromMap(map['wind'] as Map<String,dynamic>),
      clouds: CloudsModel.fromMap(map['clouds'] as Map<String,dynamic>),
      dt: map['dt'] as num,
      sys: SysModel.fromMap(map['sys'] as Map<String,dynamic>),
      timezone: map['timezone'] as num,
      id: map['id'] as num,
      name: map['name'] as String,
      cod: map['cod'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentWeatherModel.fromJson(String source) => CurrentWeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CurrentWeatherModel(coord: $coord, weather: $weather, base: $base, main: $main, visibility: $visibility, wind: $wind, clouds: $clouds, dt: $dt, sys: $sys, timezone: $timezone, id: $id, name: $name, cod: $cod)';
  }

  @override
  bool operator ==(covariant CurrentWeatherModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.coord == coord &&
      other.weather == weather &&
      other.base == base &&
      other.main == main &&
      other.visibility == visibility &&
      other.wind == wind &&
      other.clouds == clouds &&
      other.dt == dt &&
      other.sys == sys &&
      other.timezone == timezone &&
      other.id == id &&
      other.name == name &&
      other.cod == cod;
  }

  @override
  int get hashCode {
    return coord.hashCode ^
      weather.hashCode ^
      base.hashCode ^
      main.hashCode ^
      visibility.hashCode ^
      wind.hashCode ^
      clouds.hashCode ^
      dt.hashCode ^
      sys.hashCode ^
      timezone.hashCode ^
      id.hashCode ^
      name.hashCode ^
      cod.hashCode;
  }
}
