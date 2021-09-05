import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/app_constants.dart';
import 'core/constants/localization_constants.dart';
import 'core/init/get_them_all/get_it_container.dart';
import 'core/init/get_them_all/get_it_container.dart' as inject;
import 'core/init/theme_manager/theme_manager_cubit.dart';
import 'core/structure/navigation/navigation_manager.dart';
import 'core/structure/navigation/navigation_router.dart';
import 'features/authentication/login/presentation/pages/login_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  await inject.init();
  runApp(EasyLocalization(
    supportedLocales: LocalizationConstants.supportedLocales,
    path: LocalizationConstants.localizationPath,
    fallbackLocale: LocalizationConstants.fallBackLocale,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: true,
      create: (context) => sl.get<ThemeManagerCubit>(),
      child: BlocBuilder<ThemeManagerCubit, ThemeData>(
        builder: (context, themeState) {
          return MaterialApp(
            theme: themeState,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: AppConstants.APP_NAME,
            home: LoginMain(),
            navigatorKey: NavigationManager.instance.navigatorKey,
            onGenerateRoute: NavigationRouter.instance.generateRoute,
          );
        },
      ),
    );
  }
}
