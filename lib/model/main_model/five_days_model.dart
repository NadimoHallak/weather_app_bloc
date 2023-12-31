// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:weather_app_bloc/model/branch_model/city_model.dart';
import 'package:weather_app_bloc/model/branch_model/list_model.dart';

class FiveDaysModel {
  String cod;
  num message;
  num cnt;
  List<ListModel> list;
  CityModel city;
  FiveDaysModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  FiveDaysModel copyWith({
    String? cod,
    num? message,
    num? cnt,
    List<ListModel>? list,
    CityModel? city,
  }) {
    return FiveDaysModel(
      cod: cod ?? this.cod,
      message: message ?? this.message,
      cnt: cnt ?? this.cnt,
      list: list ?? this.list,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cod': cod,
      'message': message,
      'cnt': cnt,
      'list': list.map((x) => x.toMap()).toList(),
      'city': city.toMap(),
    };
  }

  factory FiveDaysModel.fromMap(Map<String, dynamic> map) {
    return FiveDaysModel(
      cod: map['cod'] as String,
      message: map['message'] as num,
      cnt: map['cnt'] as num,
      list: List<ListModel>.from((map['list'] as List<dynamic>).map<ListModel>((x) => ListModel.fromMap(x as Map<String,dynamic>),),),
      city: CityModel.fromMap(map['city'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory FiveDaysModel.fromJson(String source) => FiveDaysModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FiveDaysModel(cod: $cod, message: $message, cnt: $cnt, list: $list, city: $city)';
  }

  @override
  bool operator ==(covariant FiveDaysModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.cod == cod &&
      other.message == message &&
      other.cnt == cnt &&
      listEquals(other.list, list) &&
      other.city == city;
  }

  @override
  int get hashCode {
    return cod.hashCode ^
      message.hashCode ^
      cnt.hashCode ^
      list.hashCode ^
      city.hashCode;
  }
}
