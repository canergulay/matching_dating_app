import 'package:flutter_bloc/flutter_bloc.dart';

enum ProfessionType { STUDENT, WORKER, NONE }

class ProfessionCubit extends Cubit<ProfessionType> {
  ProfessionCubit() : super(ProfessionType.NONE);

  void changeProfession(ProfessionType profession) {
    emit(profession);
  }
}
