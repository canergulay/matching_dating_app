import 'package:matchangoo/features/Identification/data/models/interested_in_type.dart';
import 'package:matchangoo/features/Identification/presentation/cubit/gender_cubit.dart';

import 'package:json_annotation/json_annotation.dart';

part 'registration_entity.g.dart';

@JsonSerializable()
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

  RegistrationEntity(
      {this.birthday,
      this.email,
      this.fieldOfStudy,
      this.genderType,
      this.interestedIns,
      this.interests,
      this.name,
      this.password,
      this.photoURLS,
      this.photos,
      this.studycode});

  factory RegistrationEntity.fromJson(Map<String, dynamic> json) => _$RegistrationEntityFromJson(json);
  Map<String, dynamic> toJson() => _$RegistrationEntityToJson(this);

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
      if (interests == null) {
        interests = [];
      }
      interests!.add(interestId);
      print(interests);
    } else {}
  }

  void deleteInterest(String interestId) => interests?.remove(interestId);

  String getGenderType() {
    if (genderType == GenderType.MAN) {
      return 'male';
    } else {
      return 'female';
    }
  }

  List<String> getInterestedTypes() {
    List<String> listToBeReturned = [];
    if (interestedIns?.contains(InterestedType.MAN) ?? false) {
      listToBeReturned.add('male');
    }
    if (interestedIns?.contains(InterestedType.WOMAN) ?? false) {
      listToBeReturned.add('female');
    }

    return listToBeReturned;
  }

  String get getNameIfNotEmpty => name ?? '';
  String get getEmailIfNotEmpty => email ?? '';
  bool get getIfInterestsAreNotEmpty => interests?.isNotEmpty ?? false;
}
