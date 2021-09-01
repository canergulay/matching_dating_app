import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/features/Identification/presentation/cubit/gender_cubit.dart';
import 'package:matchangoo/features/Identification/presentation/cubit/interested_cubit.dart';
import 'package:matchangoo/features/Identification/presentation/cubit/profession_cubit.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification_pages.dart/repo/identification_page.dart';
import '../pages/identification_pages.dart/utils/focusnode_supplier.dart';
import '../../domain/entities/registration_entity.dart';
import '../../../../core/structure/utils/extensions/context_extension.dart';

class IdentificationCubit extends Cubit<int> {
  final IdentificationRepo identificationRepo;
  final RegistrationEntity registrationEntity;
  final GenderCubit genderCubit;
  final InterestedInCubit interestedInCubit;
  final ProfessionCubit professionCubit;
  IdentificationCubit(
      {required this.professionCubit,
      required this.interestedInCubit,
      required this.genderCubit,
      required this.identificationRepo,
      required this.registrationEntity})
      : super(0);
  ////UTILS

  final PageController pageController = PageController(initialPage: 0);

  final FocusNoder focusNoder = FocusNoder();
  bool isTwo = false;

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

  double containerWidth(BuildContext context) =>
      (context.width - context.widthUnit * 6) / identificationRepo.identificationPages().length * (state + 1);
}
