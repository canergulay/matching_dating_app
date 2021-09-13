import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/constants/app_constants.dart';
import '../../../../../core/ui/components/headlines.dart';
import '../../../../../core/components/buttons/grey_textfield.dart';

import '../../../../../core/ui/theme/palette.dart';
import 'facebook_google_buttons.dart';
import 'white_containerwpinkshadow.dart';

import '../../../../../core/structure/utils/extensions/context_extension.dart';
import '../../../../../core/structure/utils/extensions/sizedBox_extension.dart';

import '../bloc/register_bloc.dart';
import 'activatable_button.dart';

class EmailVerifyContainer extends StatelessWidget {
  final bool typed;

  const EmailVerifyContainer(this.typed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WhiteContainerWPinkShadow(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox().heightSpacer(context, 1),
            titleOne(context),
            titleTwo(context),
            textFieldContainerWithPrefix(
                context: context,
                textInputType: TextInputType.emailAddress,
                hintText: 'EMAIL_VERIFICATION.MAIL_HINT'.tr(),
                preffixIcon: Icons.mail_outline_outlined,
                onChanged: (text) => context.read<RegisterBloc>().add(EmailAdressTyped(emailAdressChanged: text))),
            textFieldContainerWithPrefix(
                context: context,
                textInputType: TextInputType.text,
                preffixIcon: Icons.lock,
                hintText: 'EMAIL_VERIFICATION.PASSWORD_HINT'.tr(),
                obscure: true,
                onChanged: (text) => context.read<RegisterBloc>().add(EmailAdressTyped(emailAdressChanged: text))),
            SizedBox().heightSpacer(context, 2),
            getAnimatedButton(typed, context, () {
              // TODO : BU APTAL BUTONU KALDIR BURDAN, NORMAL ACTIVATABLE BUTON KOY.
              context.read<RegisterBloc>().add(EmailVerifyWaiting());
            }),
            SizedBox().heightSpacer(context, 1),
            Text('* ' + 'EMAIL_VERIFICATION.EXPLANATION_TEXT'.tr()),
          ]),
        ),
        headLineEight(context, 'EMAIL_VERIFICATION.ORSIGNIN'.tr(), fontWeight: FontWeight.normal),
        SizedBox().heightSpacer(context, 2),
        facegoogleButtons(context),
      ],
    );
  }
}

AutoSizeText titleTwo(BuildContext context) {
  return AutoSizeText(
    'EMAIL_VERIFICATION.TITLE_TEXT2'.tr(),
    style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: context.widthUnit * 6, color: Palette.BIZIMBLACK, fontWeight: FontWeight.bold),
  );
}

AutoSizeText titleOne(BuildContext context) {
  return AutoSizeText(
    'EMAIL_VERIFICATION.TITLE_TEXT'.tr(),
    style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: context.widthUnit * 6, color: Palette.BIZIMBLACK, fontWeight: FontWeight.bold),
  );
}

Row facegoogleButtons(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      AnimatedFacebookGoogleButton(
          onTap: () {
            context.read<RegisterBloc>().signInViaGoogle();
          },
          type: ButtonType.GOOGLE),
      SizedBox().widthSpacer(context, 3),
      AnimatedFacebookGoogleButton(
          onTap: () {
            context.read<RegisterBloc>().signInViaFacebook();
          },
          type: ButtonType.FACEBOOK)
    ],
  );
}
