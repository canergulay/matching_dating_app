import 'package:json_annotation/json_annotation.dart';

part 'interests.g.dart';

@JsonSerializable()
class Interests {
  final String name;
  final String type;
  final String id;

  Interests({required this.id, required this.type, required this.name});

  factory Interests.fromJson(Map<String, dynamic> json) => _$InterestsFromJson(json);
  Map<String, dynamic> toJson() => _$InterestsToJson(this);
}
