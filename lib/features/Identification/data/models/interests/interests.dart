import 'package:json_annotation/json_annotation.dart';

part 'interests.g.dart';

@JsonSerializable()
class Interests {
  final String? id;
  final int? index;
  final Map<String, String>? names;

  Interests({required this.id, required this.index, required this.names});

  factory Interests.fromJson(Map<String, dynamic> json) => _$InterestsFromJson(json);
  Map<String, dynamic> toJson() => _$InterestsToJson(this);
}
