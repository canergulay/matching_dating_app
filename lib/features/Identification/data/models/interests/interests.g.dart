// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Interests _$InterestsFromJson(Map<String, dynamic> json) {
  return Interests(
    id: json['_id'] as String?,
    interest: json['interest'] as String?,
    names: (json['names'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$InterestsToJson(Interests instance) => <String, dynamic>{
      '_id': instance.id,
      'names': instance.names,
      'interest': instance.interest,
    };
