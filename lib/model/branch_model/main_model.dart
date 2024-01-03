// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MainModel {
  num temp;
  num temp_min;
  num temp_max;
  MainModel({
    required this.temp,
    required this.temp_min,
    required this.temp_max,
  });
  

  MainModel copyWith({
    num? temp,
    num? temp_min,
    num? temp_max,
  }) {
    return MainModel(
      temp: temp ?? this.temp,
      temp_min: temp_min ?? this.temp_min,
      temp_max: temp_max ?? this.temp_max,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'temp_min': temp_min,
      'temp_max': temp_max,
    };
  }

  factory MainModel.fromMap(Map<String, dynamic> map) {
    return MainModel(
      temp: map['temp'] as num,
      temp_min: map['temp_min'] as num,
      temp_max: map['temp_max'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainModel.fromJson(String source) => MainModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MainModel(temp: $temp, temp_min: $temp_min, temp_max: $temp_max)';

  @override
  bool operator ==(covariant MainModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.temp == temp &&
      other.temp_min == temp_min &&
      other.temp_max == temp_max;
  }

  @override
  int get hashCode => temp.hashCode ^ temp_min.hashCode ^ temp_max.hashCode;
}
