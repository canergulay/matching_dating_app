import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/profession/degree_types.dart';
import '../pages/identification_pages.dart/repo/degree_type_list.dart';

enum ProfessionType { STUDENT, WORKER, NONE }

class ProfessionCubit extends Cubit<ProfessionType> {
  final DegreeCubit degreeCubit;
  ProfessionCubit({required this.degreeCubit}) : super(ProfessionType.NONE);

  void changeProfession(ProfessionType profession) {
    emit(profession);
  }
}

class DegreeCubit extends Cubit<DegreeType?> {
  final DegreesRepo degreesRepo;
  DegreeCubit({required this.degreesRepo}) : super(null);

  void onValueChange(DegreeType? type) {
    emit(type ?? DegreeType(code: DegreeCodes.DOCTORATE));
  }
}
