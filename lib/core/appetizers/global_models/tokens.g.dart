// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tokens _$TokensFromJson(Map<String, dynamic> json) {
  return Tokens(
    access: json['access'] as String?,
    refresh: json['refresh'] as String?,
  );
}

Map<String, dynamic> _$TokensToJson(Tokens instance) => <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
    };
