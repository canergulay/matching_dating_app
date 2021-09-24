import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:matchangoo/features/authentication/authentication_control/presentation/authentication_widget.dart';
import 'package:matchangoo/landing.dart';
import 'core/constants/app_constants.dart';
import 'core/init/app_cubit/app_cubit.dart';
import 'core/init/get_them_all/get_it_container.dart';
import 'core/init/get_them_all/get_it_container.dart' as inject;
import 'core/init/localization/localization_initial_widget.dart';
import 'core/structure/navigation/navigation_manager.dart';
import 'core/structure/navigation/navigation_router.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  await inject.init();
  await Hive.initFlutter();

  runApp(localizationInitializer(Matchify()));
}

class Matchify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<AppCubit>(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, themeState) {
          return MaterialApp(
            theme: themeState.getTheme,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: const AuthenticationWidget(),
            title: AppConstants.shared.APP_NAME,
            navigatorKey: NavigationManager.instance.navigatorKey,
            onGenerateRoute: NavigationRouter.instance.generateRoute,
          );
        },
      ),
    );
  }
}
