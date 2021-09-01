import 'package:flutter_bloc/flutter_bloc.dart';

enum GenderType { WOMAN, MAN, NONE }

class GenderCubit extends Cubit<GenderType> {
  GenderCubit() : super(GenderType.NONE);

  void changeGender(GenderType gender) {
    emit(gender);
  }
}
