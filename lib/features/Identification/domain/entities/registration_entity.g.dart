// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationEntity _$RegistrationEntityFromJson(Map<String, dynamic> json) {
  return RegistrationEntity(
    birthday: json['birthday'] as String?,
    email: json['email'] as String?,
    fieldOfStudy: json['fieldOfStudy'] as String?,
    genderType: _$enumDecodeNullable(_$GenderTypeEnumMap, json['genderType']),
    interestedIns: (json['interestedIns'] as List<dynamic>?)?.map((e) => _$enumDecode(_$InterestedTypeEnumMap, e)).toList(),
    interests: (json['interests'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    name: json['name'] as String?,
    password: json['password'] as String?,
    photoURLS: (json['photoURLS'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    photos: (json['photos'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    studycode: json['studycode'] as String?,
  );
}

Map<String, dynamic> _$RegistrationEntityToJson(RegistrationEntity instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'studycode': instance.studycode,
      'fieldOfStudy': instance.fieldOfStudy,
      'genderType': _$GenderTypeEnumMap[instance.genderType],
      'photos': instance.photos,
      'photoURLS': instance.photoURLS,
      'birthday': instance.birthday,
      'interestedIns': instance.interestedIns?.map((e) => _$InterestedTypeEnumMap[e]).toList(),
      'interests': instance.interests,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$GenderTypeEnumMap = {
  GenderType.WOMAN: 'WOMAN',
  GenderType.MAN: 'MAN',
  GenderType.NONE: 'NONE',
};

const _$InterestedTypeEnumMap = {
  InterestedType.WOMAN: 'WOMAN',
  InterestedType.MAN: 'MAN',
  InterestedType.NONE: 'NONE',
};
