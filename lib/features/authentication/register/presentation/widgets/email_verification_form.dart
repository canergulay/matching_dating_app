import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/ui/components/headlines.dart';
import '../../../../../core/components/buttons/grey_textfield.dart';

import '../../../../../core/ui/theme/palette.dart';
import 'facebook_google_buttons.dart';
import 'white_containerwpinkshadow.dart';

import '../../../../../core/structure/utils/extensions/context_extension.dart';
import '../../../../../core/structure/utils/extensions/sizedBox_extension.dart';

import '../bloc/register_bloc.dart';
import 'activatable_button.dart';

final String TITLE_TEXT = "Please enter your";
final String TITLE_TEXT2 = "Email ID & Password";

final String EXPLANATION_TEXT = "* We will send you a verification code to pair your e-mail adress within your account.";
final String SECOND_EXPLANATION = "* You will also have the opportunity to save your account in case you forget the password.";
Column emailVerifyContainer(BuildContext context, bool typed) {
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
              hintText: 'example@mail.com',
              preffixIcon: Icons.mail_outline_outlined,
              onChanged: (text) => context.read<RegisterBloc>().add(EmailAdressTyped(emailAdressChanged: text))),
          textFieldContainerWithPrefix(
              context: context,
              textInputType: TextInputType.text,
              preffixIcon: Icons.lock,
              hintText: 'Enter your password',
              obscure: true,
              onChanged: (text) => context.read<RegisterBloc>().add(EmailAdressTyped(emailAdressChanged: text))),
          SizedBox().heightSpacer(context, 2),
          getAnimatedButton(typed, context, () {
            context.read<RegisterBloc>().add(EmailVerifyWaiting());
          }),
          SizedBox().heightSpacer(context, 1),
          Text(EXPLANATION_TEXT),
        ]),
      ),
      headLineEight(context, 'or sign in using', fontWeight: FontWeight.normal),
      SizedBox().heightSpacer(context, 2),
      facegoogleButtons(context),
    ],
  );
}

AutoSizeText titleTwo(BuildContext context) {
  return AutoSizeText(
    TITLE_TEXT2,
    style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: context.widthUnit * 6, color: Palette.BIZIMBLACK, fontWeight: FontWeight.bold),
  );
}

AutoSizeText titleOne(BuildContext context) {
  return AutoSizeText(
    TITLE_TEXT,
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
