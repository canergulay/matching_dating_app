class RegistrationEntity {
  late String email;
  late String name;
  late int birthday;

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
