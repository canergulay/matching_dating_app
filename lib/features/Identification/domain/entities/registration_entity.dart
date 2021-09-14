import '../../data/models/interests/interests.dart';

class RegistrationEntity {
  String? email;
  String? name;
  String? studycode;
  List<String?>? photos;
  int? birthday;
  List<String?>? interests = [];

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

  void addInterestIfDoesNotExist(String interestId) {
    print('yeah');
    if (!(interests?.contains(interestId) ?? false)) {
      print('yeah2');

      interests?.add(interestId);
      print(interests);
    } else {
      print('yeah3');
    }
  }

  void deleteInterest(String interestId) => interests?.remove(interestId);

  String get getNameIfNotEmpty => name ?? '';
  String get getEmailIfNotEmpty => email ?? '';
  bool get getIfInterestsAreNotEmpty => interests?.isNotEmpty ?? false;
}
