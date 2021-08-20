import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/init/theme_manager/theme_manager_cubit.dart';
import 'package:matchangoo/core/structure/navigation/navigation_manager.dart';
import 'package:matchangoo/core/structure/utils/enums/theme_types.dart';
import 'package:matchangoo/core/ui/theme/theme_controller.dart';

import 'core/constants/app_constants.dart';
import 'core/structure/navigation/navigation_router.dart';
import 'features/login/presentation/pages/login_main.dart';
import 'core/init/get_them_all/get_it_container.dart' as inject;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await inject.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: true,
      create: (context) => ThemeManagerCubit(),
      child: BlocBuilder<ThemeManagerCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            theme: state,
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
