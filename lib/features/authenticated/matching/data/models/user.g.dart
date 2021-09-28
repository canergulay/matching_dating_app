// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    age: json['age'] as int?,
    awayfrom: json['awayfrom'] as double?,
    interests: (json['interests'] as List<dynamic>?)?.map((e) => e == null ? null : Interests.fromJson(e as Map<String, dynamic>)).toList(),
    pictures: (json['pictures'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    profession: json['profession'] as String?,
    fieldofstudy: json['fos'] as String?,
    userName: json['userName'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userName': instance.userName,
      'pictures': instance.pictures,
      'age': instance.age,
      'interests': instance.interests,
      'profession': instance.profession,
      'awayfrom': instance.awayfrom,
    };
