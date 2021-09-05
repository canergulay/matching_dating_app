import 'package:flutter_bloc/flutter_bloc.dart';

enum InterestedType { WOMAN, MAN, NONE }

class InterestedInCubit extends Cubit<InterestedState> {
  InterestedInCubit() : super(InterestedChoosen(genders: [InterestedType.NONE]));

  bool changeInterests(
    InterestedType gender,
  ) {
    List<InterestedType> interests = (state as InterestedChoosen).genders;

    bool isAlreadyIncluded = interests.contains(gender);

    if (isAlreadyIncluded) {
      interests.remove(gender);
    } else {
      interests.add(gender);
    }
    print(interests);
    emit(InterestedChoosen(genders: interests));

    return interests.length > 1;
  }
}

abstract class InterestedState {}

class InterestedChoosen extends InterestedState {
  List<InterestedType> genders;
  InterestedChoosen({required this.genders});
}