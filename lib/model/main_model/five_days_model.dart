// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:weather_app_bloc/model/branch_model/city_model.dart';
import 'package:weather_app_bloc/model/branch_model/list_model.dart';

class FiveDaysModel {

  List<ListModel> list;
  CityModel city;
  FiveDaysModel({
    required this.list,
    required this.city,
  });
  

  FiveDaysModel copyWith({
    List<ListModel>? list,
    CityModel? city,
  }) {
    return FiveDaysModel(
      list: list ?? this.list,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': list.map((x) => x.toMap()).toList(),
      'city': city.toMap(),
    };
  }

  factory FiveDaysModel.fromMap(Map<String, dynamic> map) {
    return FiveDaysModel(
      list: List<ListModel>.from((map['list'] as List<dynamic>).map<ListModel>((x) => ListModel.fromMap(x as Map<String,dynamic>),),),
      city: CityModel.fromMap(map['city'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory FiveDaysModel.fromJson(String source) => FiveDaysModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FiveDaysModel(list: $list, city: $city)';

  @override
  bool operator ==(covariant FiveDaysModel other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.list, list) &&
      other.city == city;
  }

  @override
  int get hashCode => list.hashCode ^ city.hashCode;
}
