// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Interests _$InterestsFromJson(Map<String, dynamic> json) {
  return Interests(
    id: json['_id'] as String,
    type: json['type'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$InterestsToJson(Interests instance) => <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      '_id': instance.id,
    };
