import '../../data/models/interests/interests.dart';

class RegistrationEntity {
  String? email;
  String? name;
  int? birthday;
  List<Interests?>? interests;

  set setName(String name) {
    this.name = name;
  }

  set setEmail(String email) {
    this.email = email;
  }

  set setBirthday(int birthday) {
    this.birthday = birthday;
  }

  String get getNameIfNotEmpty => name ?? '';
  String get getEmailIfNotEmpty => email ?? '';
}
