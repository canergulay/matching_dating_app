import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/init/get_them_all/get_it_container.dart';
import '../../../../../core/structure/utils/widgets/background_widget_wlogo.dart';
import '../../../../../core/structure/utils/widgets/logo.dart';
import '../../../../Identification/presentation/pages/identification.dart';
import '../bloc/register_bloc.dart';
import '../widgets/email_verification_code.dart';
import '../widgets/email_verification_error.dart';
import '../widgets/email_verification_form.dart';
import '../widgets/white_containerwpinkshadow.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl.get<RegisterBloc>()),
        BlocProvider(create: (_) => sl.get<RegisterBloc>().identificationCubit),
      ],
      child: SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
          child: BackGroundContainerWithOutLogo(
            child: Column(
              children: [
                matchifyLogoWithBackButton(context),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    if (state is RegisterInitial) {
                      return Expanded(child: WhiteContainerWPinkShadow(child: Identification()));
                      // return columnSuplier(context: context, child: emailVerifyContainer(context, false));
                    } else if (state is RegisterEmailAdressTyped) {
                      return emailVerifyContainer(context, true);
                    } else if (state is RegisterWithEmailSent) {
                      return emailCodeVerificationCodeEnter(context);
                    } else if (state is RegisterWithEmailVerified) {
                      return Expanded(child: WhiteContainerWPinkShadow(child: identificationPageView(context)));
                    } else {
                      return emailCouldNotBeVerified(context);
                    }
                  },
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
