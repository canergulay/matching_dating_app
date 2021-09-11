import 'package:json_annotation/json_annotation.dart';

part 'interests.g.dart';

@JsonSerializable()
class Interests {
  final String? id;
  final Map<String, String>? names;
  final String? interest;

  Interests({required this.id, required this.interest, required this.names});

  factory Interests.fromJson(Map<String, dynamic> json) => _$InterestsFromJson(json);
  Map<String, dynamic> toJson() => _$InterestsToJson(this);
}
