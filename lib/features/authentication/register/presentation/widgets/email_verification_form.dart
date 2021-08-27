import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/buttons/animated_button.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';
import 'package:matchangoo/core/structure/utils/widgets/background_widget_wlogo.dart';
import 'package:matchangoo/core/ui/components/headlines.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';
import 'package:matchangoo/features/authentication/register/presentation/widgets/white_containerwpinkshadow.dart';

import '../../../../../core/structure/utils/extensions/context_extension.dart';
import '../../../../../core/structure/utils/extensions/sizedBox_extension.dart';

import '../bloc/register_bloc.dart';
import 'activatable_button.dart';

final String TITLE_TEXT = "Please enter your";
final String TITLE_TEXT2 = "Email ID";

final String EXPLANATION_TEXT = "* We will send you a verification code to pair your e-mail adress within your account.";
final String SECOND_EXPLANATION = "* You will also have the opportunity to save your account in case you forget the password.";
Container emailVerifyContainer(BuildContext context, bool typed) {
  return whiteContainerWPinkShadow(
    context,
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox().heightSpacer(context, 1),
        titleOne(context),
        titleTwo(context),
        textFieldContainer(context),
        SizedBox().heightSpacer(context, 2),
        getAnimatedButton(typed, context, () {
          context.read<RegisterBloc>().add(EmailVerifyWaiting());
        }),
        SizedBox().heightSpacer(context, 1),
        Text(EXPLANATION_TEXT),
        SizedBox().heightSpacer(context, 2),
        Text(SECOND_EXPLANATION),
      ],
    ),
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

Container textFieldContainer(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Palette.TEXTFIELDGREY,
    ),
    margin: EdgeInsets.only(top: context.heightUnit * 4),
    child: TextField(
        style:
            Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: context.widthUnit * 4, color: Palette.BIZIMBLACK, fontWeight: FontWeight.w500),
        onChanged: (text) => context.read<RegisterBloc>().add(EmailAdressTyped(emailAdressChanged: text)),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: context.widthUnit * 3.99999),
          hintText: 'example@email.com',
          alignLabelWithHint: false,
          prefixIcon: Icon(
            Icons.mail_outline_outlined,
            color: Colors.black45,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.black38, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.black38, width: 0.5),
          ),
        )),
  );
}
