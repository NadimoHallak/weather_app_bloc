// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:weather_app_bloc/model/branch_model/coord_model.dart';

class CityModel {
  num id;
  String name;
  CoordModel coord;
  String country;
  num population;
  num timezone;
  num sunrise;
  num sunset;
  CityModel({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  CityModel copyWith({
    num? id,
    String? name,
    CoordModel? coord,
    String? country,
    num? population,
    num? timezone,
    num? sunrise,
    num? sunset,
  }) {
    return CityModel(
      id: id ?? this.id,
      name: name ?? this.name,
      coord: coord ?? this.coord,
      country: country ?? this.country,
      population: population ?? this.population,
      timezone: timezone ?? this.timezone,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'coord': coord.toMap(),
      'country': country,
      'population': population,
      'timezone': timezone,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      id: map['id'] as num,
      name: map['name'] as String,
      coord: CoordModel.fromMap(map['coord'] as Map<String,dynamic>),
      country: map['country'] as String,
      population: map['population'] as num,
      timezone: map['timezone'] as num,
      sunrise: map['sunrise'] as num,
      sunset: map['sunset'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) => CityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CityModel(id: $id, name: $name, coord: $coord, country: $country, population: $population, timezone: $timezone, sunrise: $sunrise, sunset: $sunset)';
  }

  @override
  bool operator ==(covariant CityModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.coord == coord &&
      other.country == country &&
      other.population == population &&
      other.timezone == timezone &&
      other.sunrise == sunrise &&
      other.sunset == sunset;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      coord.hashCode ^
      country.hashCode ^
      population.hashCode ^
      timezone.hashCode ^
      sunrise.hashCode ^
      sunset.hashCode;
  }
}
