import 'package:flutter_bloc/flutter_bloc.dart';

class TabbarCubit extends Cubit<int> {
  TabbarCubit() : super(0);
  void changePage(int index) {
    emit(index);
  }
}
