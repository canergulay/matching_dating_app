// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interest_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterestResponse _$InterestResponseFromJson(Map<String, dynamic> json) {
  return InterestResponse(
    hobbies: (json['hobbies'] as List<dynamic>)
        .map((e) => Interests.fromJson(e as Map<String, dynamic>))
        .toList(),
    interests: (json['interests'] as List<dynamic>)
        .map((e) => Interests.fromJson(e as Map<String, dynamic>))
        .toList(),
    sports: (json['sports'] as List<dynamic>)
        .map((e) => Interests.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$InterestResponseToJson(InterestResponse instance) =>
    <String, dynamic>{
      'sports': instance.sports,
      'interests': instance.interests,
      'hobbies': instance.hobbies,
    };
