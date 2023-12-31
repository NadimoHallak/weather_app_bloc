// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CloudsModel {
  num all;
  CloudsModel({
    required this.all,
  });

  CloudsModel copyWith({
    num? all,
  }) {
    return CloudsModel(
      all: all ?? this.all,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'all': all,
    };
  }

  factory CloudsModel.fromMap(Map<String, dynamic> map) {
    return CloudsModel(
      all: map['all'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory CloudsModel.fromJson(String source) => CloudsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CloudsModel(all: $all)';

  @override
  bool operator ==(covariant CloudsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.all == all;
  }

  @override
  int get hashCode => all.hashCode;
}
