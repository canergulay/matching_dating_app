import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../pages/identification_pages.dart/sections/second_section.dart';
import '../pages/identification_pages.dart/utils/focusnode_supplier.dart';
import '../pages/identification_pages.dart/sections/whats_your_birth.dart';
import '../pages/identification_pages.dart/sections/whats_your_name.dart';
import '../../domain/entities/registration_entity.dart';
import '../../../../core/structure/utils/extensions/context_extension.dart';
import '../pages/identification_pages.dart/sections/first_section.dart';
import '../widgets/keep_alive.dart';

class IdentificationCubit extends Cubit<int> {
  IdentificationCubit() : super(0);
  ////UTILS
  final PageController pageController = PageController(initialPage: 0);
  final RegistrationEntity registrationEntity = RegistrationEntity();
  final FocusNoder focusNoder = FocusNoder();
  bool isTwo = false;

  ///IDENTIFICATION PAGE
  List<Widget> identificationPages(BuildContext context) {
    return [
      KeepAlivePage(child: WhatIsYourName()),
      KeepAlivePage(child: WhenIsYourBirthday()),
      KeepAlivePage(child: FirstSection()),
      KeepAlivePage(child: SecondSection()),
    ];
  }

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

  void yesItIsTwo() {
    isTwo = true;
  }

  void noItIsNotTwo() {
    isTwo = false;
  }

  double containerWidth(BuildContext context) => (context.width - context.widthUnit * 6) / identificationPages(context).length * (state + 1);
}
