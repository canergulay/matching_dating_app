import 'package:json_annotation/json_annotation.dart';
import 'interests.dart';

part 'interest_response.g.dart';

@JsonSerializable()
class InterestResponse {
  final List<Interests> sports;
  final List<Interests> interests;
  final List<Interests> hobbies;
  InterestResponse({required this.hobbies, required this.interests, required this.sports});
  factory InterestResponse.fromJson(Map<String, dynamic> json) => _$InterestResponseFromJson(json);
  Map<String, dynamic> toJson() => _$InterestResponseToJson(this);
}
