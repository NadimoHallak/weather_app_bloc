// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SysModel {
  num type;
  num id;
  String country;
  num sunrise;
  num sunset;
  SysModel({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });


  SysModel copyWith({
    num? type,
    num? id,
    String? country,
    num? sunrise,
    num? sunset,
  }) {
    return SysModel(
      type: type ?? this.type,
      id: id ?? this.id,
      country: country ?? this.country,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'id': id,
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  factory SysModel.fromMap(Map<String, dynamic> map) {
    return SysModel(
      type: map['type'] as num,
      id: map['id'] as num,
      country: map['country'] as String,
      sunrise: map['sunrise'] as num,
      sunset: map['sunset'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory SysModel.fromJson(String source) => SysModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SysModel(type: $type, id: $id, country: $country, sunrise: $sunrise, sunset: $sunset)';
  }

  @override
  bool operator ==(covariant SysModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.type == type &&
      other.id == id &&
      other.country == country &&
      other.sunrise == sunrise &&
      other.sunset == sunset;
  }

  @override
  int get hashCode {
    return type.hashCode ^
      id.hashCode ^
      country.hashCode ^
      sunrise.hashCode ^
      sunset.hashCode;
  }
}
