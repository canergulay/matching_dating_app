import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification_pages.dart/second_section.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification_pages.dart/whats_your_birth.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification_pages.dart/whats_your_name.dart';
import 'package:matchangoo/features/Identification/domain/entities/registration_entity.dart';
import '../../../../core/structure/utils/extensions/context_extension.dart';
import '../pages/identification_pages.dart/first_section.dart';
import '../widgets/keep_alive.dart';

class IdentificationCubit extends Cubit<int> {
  IdentificationCubit() : super(0);

  final PageController pageController = PageController(initialPage: 0);
  final RegistrationEntity registrationEntity = RegistrationEntity();

  ///IDENTIFICATION PAGE
  List<Widget> identificationPages(BuildContext context) {
    return [
      KeepAlivePage(child: WhatIsYourName()),
      KeepAlivePage(child: WhenIsYourBirthday()),
      KeepAlivePage(child: FirstSection()),
      KeepAlivePage(child: SecondSection()),
    ];
  }

/*
  void onPageChanged(int page) {
    
    page > pageKeepTrack ? goToNext() : goToPrevious();
    page > pageKeepTrack ? pageKeepTrack++ : pageKeepTrack--;
  }

  void goToNext() {
    emit(state + 1);
  }*/
  /// PAGE LOGIC ///////
  void goToNextPage() {
    emit(state + 1);

    pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  void goToPrevious() {
    emit(state - 1);
  }

  void getPrevious() {
    if (state != 0) {
      pageController.previousPage(duration: Duration(milliseconds: 200), curve: Curves.easeInCubic);
      emit(state - 1);
    }
  }
/////////////

///// IDENTIFICATION CONFIGURATIONS
  void setName(String uname) {
    registrationEntity.name = uname;
  }

  void getValue() {
    print(registrationEntity.name);
  }

  double containerWidth(BuildContext context) => (context.width - context.widthUnit * 6) / identificationPages(context).length * (state + 1);
}
