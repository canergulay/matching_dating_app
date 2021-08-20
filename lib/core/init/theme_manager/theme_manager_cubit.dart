import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/structure/utils/enums/theme_types.dart';
import 'package:matchangoo/core/ui/theme/theme_controller.dart';

class ThemeManagerCubit extends Cubit<ThemeData> {
  ThemeManagerCubit() : super(ThemeController.getTheme(ThemeType.LIGHT));

  void changeTheme() {
    if (state.brightness == Brightness.light) {
      emit(ThemeController.getTheme(ThemeType.DARK));
    } else {
      emit(ThemeController.getTheme(ThemeType.LIGHT));
    }
  }
}
