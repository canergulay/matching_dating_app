import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/init/get_them_all/get_it_container.dart';
import 'package:matchangoo/core/structure/utils/widgets/background_widget_wlogo.dart';
import 'package:matchangoo/features/authentication/authentication_control/bloc/authentication_bloc.dart';
import 'package:matchangoo/features/authentication/authentication_control/presentation/authentication_loading.dart';
import 'package:matchangoo/features/home/presentation/pages/home_screen.dart';
import 'package:matchangoo/landing.dart';

class AuthenticationWidget extends StatelessWidget {
  const AuthenticationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<AuthenticationBloc>(),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationLoading) {
            return AuthenticationLoadingWidget();
          } else if (state is AuthenticationNotAuthenticated) {
            return Landing();
          } else {
            return HomeScreen();
          }
        },
      ),
    );
  }
}
