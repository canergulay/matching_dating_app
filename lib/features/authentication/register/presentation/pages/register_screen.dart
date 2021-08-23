import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/init/get_them_all/get_it_container.dart';
import 'package:matchangoo/features/Identification/presentation/cubit/identification_cubit.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification.dart';
import 'package:matchangoo/features/authentication/register/presentation/bloc/register_bloc.dart';
import 'package:matchangoo/features/authentication/register/presentation/widgets/email_verification_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl.get<RegisterBloc>()),
        BlocProvider(create: (_) => sl.get<RegisterBloc>().identificationCubit),
      ],
      child: Scaffold(body: Center(
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            if (state is RegisterInitial) {
              return emailVerifyContainer(context, false);
            } else if (state is RegisterEmailAdressTyped) {
              return emailVerifyContainer(context, true);
            } else if (state is RegisterWithEmailVerified) {
              return Identification();
            } else {
              return Identification();
            }
          },
        ),
      )),
    );
  }
}
