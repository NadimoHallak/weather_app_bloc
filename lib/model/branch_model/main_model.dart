// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MainModel {
  num temp;
  num feels_like;
  num temp_min;
  num temp_max;
  num pressure;
  num humidity;
  num sea_level;
  num grnd_level;
  MainModel({
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.humidity,
    required this.sea_level,
    required this.grnd_level,
  });

  MainModel copyWith({
    num? temp,
    num? feels_like,
    num? temp_min,
    num? temp_max,
    num? pressure,
    num? humidity,
    num? sea_level,
    num? grnd_level,
  }) {
    return MainModel(
      temp: temp ?? this.temp,
      feels_like: feels_like ?? this.feels_like,
      temp_min: temp_min ?? this.temp_min,
      temp_max: temp_max ?? this.temp_max,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      sea_level: sea_level ?? this.sea_level,
      grnd_level: grnd_level ?? this.grnd_level,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'feels_like': feels_like,
      'temp_min': temp_min,
      'temp_max': temp_max,
      'pressure': pressure,
      'humidity': humidity,
      'sea_level': sea_level,
      'grnd_level': grnd_level,
    };
  }

  factory MainModel.fromMap(Map<String, dynamic> map) {
    return MainModel(
      temp: map['temp'] as num,
      feels_like: map['feels_like'] as num,
      temp_min: map['temp_min'] as num,
      temp_max: map['temp_max'] as num,
      pressure: map['pressure'] as num,
      humidity: map['humidity'] as num,
      sea_level: map['sea_level'] as num,
      grnd_level: map['grnd_level'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainModel.fromJson(String source) => MainModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MainModel(temp: $temp, feels_like: $feels_like, temp_min: $temp_min, temp_max: $temp_max, pressure: $pressure, humidity: $humidity, sea_level: $sea_level, grnd_level: $grnd_level)';
  }

  @override
  bool operator ==(covariant MainModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.temp == temp &&
      other.feels_like == feels_like &&
      other.temp_min == temp_min &&
      other.temp_max == temp_max &&
      other.pressure == pressure &&
      other.humidity == humidity &&
      other.sea_level == sea_level &&
      other.grnd_level == grnd_level;
  }

  @override
  int get hashCode {
    return temp.hashCode ^
      feels_like.hashCode ^
      temp_min.hashCode ^
      temp_max.hashCode ^
      pressure.hashCode ^
      humidity.hashCode ^
      sea_level.hashCode ^
      grnd_level.hashCode;
  }
}
