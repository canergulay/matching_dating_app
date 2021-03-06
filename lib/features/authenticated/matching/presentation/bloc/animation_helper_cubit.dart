import 'package:flutter_bloc/flutter_bloc.dart';

class HelperAnimatorCubit extends Cubit<double> {
  HelperAnimatorCubit() : super(0) {
    print('İNİİİİT');
  }

  void update(double value) {
    emit(state + value);
  }

  void zeroize() {
    print(state.toString() + 'işte state');
    emit(0);
    print(state.toString() + 'işte state');
  }

  void finish() {
    for (int i = 0; i < 20; i++) {
      print(state + i / 1000);
      emit(state + i / 1000);
    }
  }

  void reverse() {
    if (state < 0) {
      while (state < 0) {
        print(state);
        emit(state + 0.001);
      }
    } else {
      while (state > 0) {
        print(state);
        emit(state - 0.001);
      }
    }
    emit(0);
  }
}
