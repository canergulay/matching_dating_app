import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/utils/adaptive_dialoger.dart';
import 'package:matchangoo/core/components/utils/get_out_of_here.dart';
import 'package:matchangoo/core/structure/utils/widgets/background_widget_wlogo.dart';
import 'package:matchangoo/core/structure/utils/widgets/logo.dart';
import 'package:matchangoo/features/Identification/presentation/cubit/identification_cubit.dart';
import 'package:matchangoo/features/authentication/register/presentation/widgets/white_containerwpinkshadow.dart';
import '../../../../../core/init/get_them_all/get_it_container.dart';
import '../../../../Identification/presentation/pages/identification.dart';
import '../bloc/register_bloc.dart';
import '../widgets/email_verification_code.dart';
import '../widgets/email_verification_error.dart';
import '../widgets/email_verification_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(create: (context) => sl.get<RegisterBloc>()),
        BlocProvider<IdentificationCubit>(create: (context) => context.read<RegisterBloc>().identificationCubit),
      ],
      child: SafeArea(
        child: Scaffold(body: SingleChildScrollView(
          child: BackGroundContainerWithOutLogo(
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                if (state is RegisterInitial) {
                  //return Expanded(child: WhiteContainerWPinkShadow(child: Identification()));
                  return columnSupplierWbBUTTON(state, context, emailVerifyContainer(context, false));
                } else if (state is RegisterEmailAdressTyped) {
                  return columnSupplierWbBUTTON(state, context, emailVerifyContainer(context, true));
                } else if (state is RegisterWithEmailSent) {
                  return columnSupplierWbBUTTON(state, context, emailCodeVerificationCodeEnter(context));
                } else if (state is RegisterWithEmailVerified) {
                  return columnSupplierWbBUTTON(state, context, Expanded(child: WhiteContainerWPinkShadow(child: Identification())));
                } else {
                  return columnSupplierWbBUTTON(state, context, emailCouldNotBeVerified(context));
                }
              },
            ),
          ),
        )),
      ),
    );
  }
}

Column columnSupplierWbBUTTON(RegisterState state, BuildContext context, Widget child) => Column(
      children: [
        matchifyLogoWithBackButtonWcustomPress(
            context: context,
            onTap: () async {
              final String message = "You will lose registration process once you leave this page.";
              final String rUsure = "Are you sure?";
              if (state is RegisterWithEmailVerified) {
                // IF WE LOGIN WITH A VALID EMAIL / FACEBOOK / GMAIL
                if (context.read<IdentificationCubit>().pageController.page != 0) {
                  print('sa');
                  // IF IT IS NOT THE FIRST PAGE, WE LET THE USER GO BACK IN THE IDENTIFICATION PAGES
                  // WHICH IS NOTHING BUT A SIMPLE PAGEVIEW
                  context.read<IdentificationCubit>().getPrevious();
                } else {
                  print('sa2');

                  // IF IT IS THE ZEROTH PAGE AND THE USER PRESSES THE BACK BUTTON
                  // WE WILL TAKE THEM THROUGH THE MAIN PAGE AND KILL THE REGISTRATION PROCESS

                  OkCancelResult result = await AdaptiveDialoger.showSimpleOkCancel(
                    context: context,
                    title: rUsure,
                    message: message,
                  );
                  if (result == OkCancelResult.ok) {
                    getOutOfHere(context);
                  }
                }
              } else {
                // IF WE ARE STILL IN THE MAIL VERIFICATON PROCESS, WE WILL AGAIN KILL THE PROCESS
                OkCancelResult result = await AdaptiveDialoger.showSimpleOkCancel(
                  context: context,
                  title: rUsure,
                  message: message,
                );
                if (result == OkCancelResult.ok) {
                  getOutOfHere(context);
                }
              }
            }),
        child
      ],
    );
