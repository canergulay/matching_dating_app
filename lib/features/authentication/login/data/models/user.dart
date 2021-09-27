import 'package:json_annotation/json_annotation.dart';
import 'package:matchangoo/core/appetizers/global_models/location.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel {
  late String? username;
  late String? usermail;
  late Location location;
  late List<String?>? photos;
  late List<int>? interestedin;
  late List<int>? interests;
  late int? studycode;
  late String? fos;
  late int? gender;
  late int? birthday;
  UserModel(this.birthday, this.fos, this.gender, this.interestedin, this.interests, this.photos, this.studycode, this.usermail, this.username);

  setLocation(Location location) {
    this.location = location;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
