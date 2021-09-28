import 'package:matchangoo/features/Identification/data/models/interests/interests.dart';

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String? userName;
  final List<String?>? pictures;
  final int? age;
  final List<Interests?>? interests;
  final String? profession;
  final String? fieldofstudy;
  final double? awayfrom;
  User(
      {required this.age,
      required this.fieldofstudy,
      required this.awayfrom,
      required this.interests,
      required this.pictures,
      required this.profession,
      required this.userName});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
