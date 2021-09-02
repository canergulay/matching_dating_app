import '../../data/models/interests/interests.dart';

class RegistrationEntity {
  late String email;
  late String name;
  late int birthday;
  late List<Interests> interests;

  set setName(String name) {
    this.name = name;
  }

  set setEmail(String email) {
    this.email = email;
  }

  set setBirthday(int birthday) {
    this.birthday = birthday;
  }
}
