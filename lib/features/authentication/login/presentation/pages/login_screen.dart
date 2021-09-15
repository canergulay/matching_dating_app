import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:matchangoo/core/appetizers/enums.dart/auth_type.enum.dart';
import 'package:matchangoo/core/components/buttons/facebook_google_buttons.dart';
import 'package:matchangoo/core/components/buttons/grey_textfield.dart';
import 'package:matchangoo/core/components/texts/auto_size_titles.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';
import 'package:matchangoo/core/structure/utils/widgets/background_widget_wlogo.dart';
import 'package:matchangoo/core/structure/utils/widgets/logo.dart';
import 'package:matchangoo/core/ui/components/headlines.dart';
import 'package:matchangoo/features/authentication/register/presentation/widgets/auth_container.dart';
import 'package:matchangoo/features/authentication/register/presentation/widgets/white_containerwpinkshadow.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackGroundContainerWithOutLogo(
      child: SingleChildScrollView(
        child: Column(
          children: [
            matchifyLogoWithBackButtonWcustomPress(
                context: context,
                onTap: () {
                  Navigator.of(context).pop();
                }),
            loginBody(context),
          ],
        ),
      ),
    ));
  }

  Column loginBody(BuildContext context) {
    return Column(
      children: [
        AuthContainer(authType: AuthType.login, buttonPressed: (email, password) {}, explanation: ''),
        headLineEight(context, 'EMAIL_VERIFICATION.ORLOGIN'.tr(), fontWeight: FontWeight.normal),
        const SizedBox().heightSpacer(context, 2),
        facegoogleButtons(context, facebookOnTap: () {}, googleOnTap: () {}),
        const SizedBox().heightSpacer(context, 2),
      ],
    );
  }
}
