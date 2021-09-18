import 'package:matchangoo/features/Identification/data/models/interested_in_type.dart';
import 'package:matchangoo/features/Identification/data/models/profession/degree_types.dart';
import 'package:matchangoo/features/Identification/presentation/cubit/gender_cubit.dart';

import '../../data/models/interests/interests.dart';

class RegistrationEntity {
  late String? name;
  late String? email;
  late String? password;
  late String? studycode;
  late String? fieldOfStudy;
  late GenderType? genderType;
  late List<String?>? photos;
  late List<String?>? photoURLS;
  late String? birthday;
  late List<InterestedType>? interestedIns;
  late List<String?>? interests = [];

  set setName(String? name) {
    this.name = name;
  }

  set setEmail(String? email) {
    this.email = email;
  }

  set setPassword(String? password) {
    this.password = password;
  }

  void setBirthday(String dd, String mm, String yyyy) {
    this.birthday = dd + mm + yyyy;
  }

  set setStudyCode(String? studyCode) {
    this.studycode = studyCode;
  }

  set setFieldOfStudy(String? fieldOfStudy) {
    this.fieldOfStudy = fieldOfStudy;
  }

  set setGenderType(GenderType? genderType) {
    this.genderType = genderType;
  }

  set setPhotos(List<String?>? photos) {
    this.photos = photos;
  }

  set setPhotoURLS(List<String?>? photoURLS) {
    this.photoURLS = photoURLS;
  }

  set setInterestedIns(List<InterestedType> interestedIns) {
    this.interestedIns = interestedIns;
  }

  void addInterestIfDoesNotExist(String interestId) {
    if (!(interests?.contains(interestId) ?? false)) {
      interests?.add(interestId);
      print(interests);
    } else {}
  }

  void deleteInterest(String interestId) => interests?.remove(interestId);

  String genderTypeConverter(GenderType type) {
    if (type == GenderType.MAN) {
      return 'male';
    } else {
      return 'female';
    }
  }

  String get getNameIfNotEmpty => name ?? '';
  String get getEmailIfNotEmpty => email ?? '';
  bool get getIfInterestsAreNotEmpty => interests?.isNotEmpty ?? false;
}
