import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/features/Identification/data/models/interested_in_type.dart';

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
    emit(InterestedChoosen(genders: interests));

    return interests.length > 1;
  }

  void deleteNone() {
    List<InterestedType> interests = (state as InterestedChoosen).genders;
    interests.remove(InterestedType.NONE);
    emit(InterestedChoosen(genders: interests));
  }
}

abstract class InterestedState {}

class InterestedChoosen extends InterestedState {
  List<InterestedType> genders;
  InterestedChoosen({required this.genders});
}
