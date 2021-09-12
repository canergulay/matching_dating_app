import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/Identification/data/models/interest_type.dart';

import 'package:matchangoo/features/Identification/data/models/interests/interests.dart';
import 'package:matchangoo/features/Identification/domain/usecases/get_interests.dart';

class InterestManagerCubit extends Cubit<InterestType> {
  final GetAllInterests getAllInterests;
  final InterestsCubit sportscubit;
  final InterestsCubit onlinegamescubit;
  final InterestsCubit languagescubit;
  final InterestsCubit petscubit;

  InterestManagerCubit(
      {required this.getAllInterests,
      required this.languagescubit,
      required this.onlinegamescubit,
      required this.petscubit,
      required this.sportscubit})
      : super(InterestType.SPORTS) {
    fetchAndEmitInterestsIfNotAlready(InterestType.SPORTS);
  }

  void changeTab(int type) {
    print('gerldi');
    emit(intToInterestType(type));
    fetchAndEmitInterestsIfNotAlready(intToInterestType(type));
  }

  InterestsCubit? getInterestCubit(InterestType type) {
    switch (type) {
      case InterestType.SPORTS:
        return sportscubit;
      case InterestType.ONLINEGAMES:
        return onlinegamescubit;
      case InterestType.LANGUAGES:
        return languagescubit;
      case InterestType.PETS:
        return petscubit;
    }
  }

  Future<void> fetchAndEmitInterestsIfNotAlready(InterestType type) async {
    InterestsCubit interestCubitToBeModified = getInterestCubit(type)!;
    if (interestCubitToBeModified.shouldFetch()) {
      //IF THE LIST OF THIS TAB HAS NOT BEEN FETCHED YET, WE WILL FETCH
      //OTHERWISE WE WONT FETCH IT AGAIN.
      Result<List<Interests>> result = await getInterests(type: type);
      result.when(success: (List<Interests> response) {
        interestCubitToBeModified.loadInterests(response);
      }, error: (CustomError error) {
        print(error.errorCode);
        print(error.message);
      });
    }
  }

  Future<Result<List<Interests>>> getInterests({required InterestType type}) async {
    return await getAllInterests(type: type);
  }
}

abstract class InterestsState {}

class InterestInitial extends InterestsState {}

class InterestLoaded extends InterestsState {
  final List<Interests> interestList;
  InterestLoaded({required this.interestList});
}

class InterestsCubit extends Cubit<InterestsState> {
  InterestsCubit() : super(InterestInitial());

  void fetchIfInitial() {
    if (state is InterestInitial) {
      print('çekicez');
    }
  }

  void loadInterests(List<Interests> interests) {
    emit(InterestLoaded(interestList: interests));
  }

  bool shouldFetch() {
    return (state is InterestInitial);
  }
}
