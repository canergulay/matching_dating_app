import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/features/authenticated/matching/data/models/user.dart';

class CandidateUsersCubit extends Cubit<List<User>?> {
  final List<User>? initialState;
  CandidateUsersCubit({this.initialState}) : super(initialState);
}
