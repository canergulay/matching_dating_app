import 'package:flutter_bloc/flutter_bloc.dart';

class OnOffCubit extends Cubit<bool> {
  final bool initialState;
  OnOffCubit({this.initialState = false}) : super(initialState);

  void on() {
    emit(true);
  }

  void off() {
    emit(false);
  }
}
