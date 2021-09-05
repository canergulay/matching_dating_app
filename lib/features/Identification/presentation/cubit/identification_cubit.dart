import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/result_error/result_freezed/result.dart';
import '../../data/models/interests/interest_response.dart';
import '../../data/repositories/interest_repositary_impl.dart';
import '../../domain/usecases/get_interests.dart';
import 'gender_cubit.dart';
import 'interested_cubit.dart';
import 'profession_cubit.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification_pages.dart/repo/identification_page.dart';
import '../pages/identification_pages.dart/utils/focusnode_supplier.dart';
import '../../domain/entities/registration_entity.dart';
import '../../../../core/structure/utils/extensions/context_extension.dart';

class IdentificationCubit extends Cubit<int> {
  final IdentificationRepo identificationRepo;
  final GetAllInterests getAllInterests;
  final RegistrationEntity registrationEntity;
  final GenderCubit genderCubit;
  final InterestedInCubit interestedInCubit;
  final ProfessionCubit professionCubit;
  IdentificationCubit(
      {required this.professionCubit,
      required this.interestedInCubit,
      required this.genderCubit,
      required this.getAllInterests,
      required this.identificationRepo,
      required this.registrationEntity})
      : super(0);
  ////UTILS
  late final InterestResponse interests;

  final PageController pageController = PageController(initialPage: 0);

  final FocusNoder focusNoder = FocusNoder();
  bool isTwo = false;

  /// PAGE LOGIC ///////
  void goToNextPage() {
    emit(state + 1);

    pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    if (state == 1) getInterests();
  }

  void goToPrevious() {
    emit(state - 1);
  }

  void getPrevious() {
    if (state != 0) {
      emit(state - 1);
      pageController.previousPage(duration: Duration(milliseconds: 200), curve: Curves.easeInCubic);
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

  Future<void> getInterests() async {
    Result<InterestResponse> result = await getAllInterests();
    print('tetikledim');
    result.when(success: (InterestResponse interestler) {
      interests = interestler;
      print(interestler);
    }, error: (err) {
      print(err);
      print(err.message);
      print(err.errorCode);
    });
  }

  double containerWidth(BuildContext context) =>
      (context.width - context.widthUnit * 6) / identificationRepo.identificationPages().length * (state + 1);
}
