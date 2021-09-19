// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    json['birthday'] as int?,
    json['fos'] as String?,
    json['gender'] as int?,
    (json['interestedin'] as List<dynamic>?)?.map((e) => e as int).toList(),
    (json['interests'] as List<dynamic>?)?.map((e) => e as int).toList(),
    (json['photos'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    json['studycode'] as int?,
    json['usermail'] as String?,
    json['username'] as String?,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'username': instance.username,
      'usermail': instance.usermail,
      'photos': instance.photos,
      'interestedin': instance.interestedin,
      'interests': instance.interests,
      'studycode': instance.studycode,
      'fos': instance.fos,
      'gender': instance.gender,
      'birthday': instance.birthday,
    };
