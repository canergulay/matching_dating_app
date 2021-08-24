import 'package:flutter_bloc/flutter_bloc.dart';

class OnOffCubit extends Cubit<bool> {
  OnOffCubit() : super(false);

  void on() {
    emit(true);
  }

  void off() {
    emit(false);
  }
}
