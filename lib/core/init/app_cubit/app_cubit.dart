import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../structure/utils/enums/theme_types.dart';
import '../../ui/theme/theme_controller.dart';

class AppCubit extends Cubit<AppState> {
  final AppState initialState;

  void changeTheme() {
    AppState newState = initialState;
    newState.currentTheme = ThemeType.DARK;
  }

  AppCubit({required this.initialState}) : super(initialState);
}

class AppState {
  ThemeType currentTheme;
  String currentLanguage;

  ThemeData get getTheme => ThemeController.getTheme(currentTheme);
  AppState({required this.currentLanguage, required this.currentTheme});
}
