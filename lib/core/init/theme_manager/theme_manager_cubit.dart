import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/structure/utils/enums/theme_types.dart';
import 'package:matchangoo/core/ui/theme/theme_controller.dart';

class ThemeManagerCubit extends Cubit<ThemeData> {
  final ThemeController themeController;
  ThemeManagerCubit(this.themeController) : super(themeController.getTheme(ThemeType.LIGHT));

  void changeTheme() {
    if (state.brightness == Brightness.light) {
      emit(themeController.getTheme(ThemeType.DARK));
    } else {
      emit(themeController.getTheme(ThemeType.LIGHT));
    }
  }
}
