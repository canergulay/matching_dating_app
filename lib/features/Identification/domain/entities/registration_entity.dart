import '../../data/models/interests/interests.dart';

class RegistrationEntity {
  String? email;
  String? name;
  String? studycode;
  List<String?>? photos;
  int? birthday;
  List<Interests?>? interests;

  set setName(String? name) {
    this.name = name;
  }

  set setEmail(String? email) {
    this.email = email;
  }

  set setBirthday(int? birthday) {
    this.birthday = birthday;
  }

  set setStudyCode(String? studyCode) {
    this.studycode = studycode;
  }

  set setPhotos(List<String?>? photos) {
    this.photos = photos;
  }

  String get getNameIfNotEmpty => name ?? '';
  String get getEmailIfNotEmpty => email ?? '';
}
