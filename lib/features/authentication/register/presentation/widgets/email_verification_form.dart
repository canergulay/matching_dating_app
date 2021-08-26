import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/structure/utils/extensions/context_extension.dart';
import '../../../../../core/structure/utils/extensions/sizedBox_extension.dart';

import '../bloc/register_bloc.dart';
import 'activatable_button.dart';

final String TITLE_TEXT = "Please verify your email adress.";
final String EXPLANATION_TEXT = "* We will send you a verification code to pair your e-mail adress within your account.";
final String SECOND_EXPLANATION = "* You will also have the opportunity to save your account in case you forget the password.";

Container emailVerifyContainer(BuildContext context, bool typed) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 3, vertical: context.heightUnit * 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          TITLE_TEXT,
          style: Theme.of(context).textTheme.headline5,
        ),
        textFieldContainer(context),
        getAnimatedButton(typed, context, () {
          context.read<RegisterBloc>().add(EmailVerifyWaiting());
        }),
        SizedBox().heightSpacer(context, 3),
        Text(EXPLANATION_TEXT),
        SizedBox().heightSpacer(context, 1),
        Text(SECOND_EXPLANATION)
      ],
    ),
  );
}

Container textFieldContainer(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 8, vertical: context.heightUnit),
    child: TextField(
        onChanged: (text) => context.read<RegisterBloc>().add(EmailAdressTyped(emailAdressChanged: text)),
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black38),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black38),
          ),
        )),
  );
}
