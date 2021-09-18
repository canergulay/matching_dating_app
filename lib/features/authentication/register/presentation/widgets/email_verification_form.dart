import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/appetizers/enums.dart/auth_type.enum.dart';
import 'package:matchangoo/core/components/buttons/facebook_google_buttons.dart';
import 'package:matchangoo/core/components/buttons/obscure_dynamic_textfield.dart';
import 'package:matchangoo/core/components/texts/auto_size_titles.dart';
import 'package:matchangoo/core/components/utils/on_off_cubit.dart';
import 'package:matchangoo/core/constants/app_constants.dart';
import 'package:matchangoo/features/authentication/register/presentation/widgets/auth_container.dart';
import '../../../../../core/ui/components/headlines.dart';
import '../../../../../core/components/buttons/grey_textfield.dart';

import '../../../../../core/ui/theme/palette.dart';
import 'facebook_google_buttons.dart';
import 'white_containerwpinkshadow.dart';

import '../../../../../core/structure/utils/extensions/context_extension.dart';
import '../../../../../core/structure/utils/extensions/sizedbox_extension.dart';

import '../bloc/register_bloc.dart';
import 'activatable_button.dart';

class EmailVerifyContainer extends StatelessWidget {
  const EmailVerifyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthContainer(
            explanation: '* ${'EMAIL_VERIFICATION.EXPLANATION_TEXT'.tr()}',
            authType: AuthType.register,
            buttonPressed: (mail, password) {
              context.read<RegisterBloc>().add(EmailVerifyWaiting(mail: mail, password: password));
            }),
        headLineEight(context, 'EMAIL_VERIFICATION.ORSIGNIN'.tr(), fontWeight: FontWeight.normal),
        const SizedBox().heightSpacer(context, 2),
        facegoogleButtons(context,
            facebookOnTap: () => context.read<RegisterBloc>().signInViaFacebook(context),
            googleOnTap: () => context.read<RegisterBloc>().signInViaGoogle(context)),
      ],
    );
  }
}
