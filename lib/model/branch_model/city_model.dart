// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:weather_app_bloc/model/branch_model/coord_model.dart';

class CityModel {
  String name;
  CoordModel coord;
  String country;
  CityModel({
    required this.name,
    required this.coord,
    required this.country,
  });

  CityModel copyWith({
    String? name,
    CoordModel? coord,
    String? country,
  }) {
    return CityModel(
      name: name ?? this.name,
      coord: coord ?? this.coord,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'coord': coord.toMap(),
      'country': country,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      name: map['name'] as String,
      coord: CoordModel.fromMap(map['coord'] as Map<String, dynamic>),
      country: map['country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) =>
      CityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CityModel(name: $name, coord: $coord, country: $country)';

  @override
  bool operator ==(covariant CityModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.coord == coord &&
        other.country == country;
  }

  @override
  int get hashCode => name.hashCode ^ coord.hashCode ^ country.hashCode;
}
