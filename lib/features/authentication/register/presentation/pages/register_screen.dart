import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/structure/navigation/navigation_manager.dart';
import 'package:matchangoo/core/structure/utils/widgets/background_widget_wlogo.dart';
import 'package:matchangoo/core/structure/utils/widgets/logo.dart';
import '../../../../../core/init/get_them_all/get_it_container.dart';
import '../../../../Identification/presentation/pages/identification.dart';
import '../bloc/register_bloc.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import '../widgets/email_verification_code.dart';
import '../widgets/email_verification_error.dart';
import '../widgets/email_verification_form.dart';

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
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: BackGroundContainerWithLogo(
                child: BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    if (state is RegisterInitial) {
                      // return Identification();
                      return columnSuplier(context: context, child: emailVerifyContainer(context, false));
                    } else if (state is RegisterEmailAdressTyped) {
                      return columnSuplier(context: context, child: emailVerifyContainer(context, true));
                    } else if (state is RegisterWithEmailSent) {
                      return columnSuplier(context: context, child: emailCodeVerificationCodeEnter(context));
                    } else if (state is RegisterWithEmailVerified) {
                      return Container(height: context.height, child: Identification());
                    } else {
                      return columnSuplier(context: context, child: emailCouldNotBeVerified(context));
                    }
                  },
                ),
              ),
            )),
      ),
    );
  }
}

Column columnSuplier({required BuildContext context, required Widget child}) {
  return Column(
    children: [matchifyLogoWithBackButton(context), child],
  );
}
