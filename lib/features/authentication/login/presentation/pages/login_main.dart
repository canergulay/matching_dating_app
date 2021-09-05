import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/asset_paths.dart';
import '../../../../../core/structure/utils/widgets/background_widget_wlogo.dart';
import '../../../../../core/structure/utils/widgets/logo.dart';
import '../../../../../core/ui/components/headlines.dart';
import '../../../../../core/ui/theme/palette.dart';
import '../../../../../core/components/buttons/animated_button.dart';
import '../../../../../core/structure/utils/extensions/context_extension.dart';
import '../../../../../core/structure/navigation/navigation_manager.dart';
import '../../../../../core/structure/utils/extensions/sizedBox_extension.dart';

class LoginMain extends StatelessWidget {
  const LoginMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundContainerWithOutLogo(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            matchifyLogo(context),
            firstSectionMethod(context),
            SizedBox().heightSpacer(context, 2),
            secondShit(context),
            SizedBox().heightSpacer(context, 7),
          ],
        ),
      ),
    );
  }

  Expanded firstSectionMethod(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: context.widthUnit * 9),
        child: Image.asset(AssetPaths.MAINVECTOR),
      ),
    );
  }
}

Expanded secondShit(BuildContext context) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 6, vertical: context.heightUnit * 1.5),
          child: headLineThree(context, 'MAIN_SCREEN.TITLE'.tr(namedArgs: {'appname': AppConstants.APP_NAME})),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 5, vertical: context.heightUnit * 1.5),
          child: AnimatedButton(
            buttonRadius: 15,
            title: 'MAIN_SCREEN.CREATE_ACCOUNT'.tr(),
            buttonColor: Color(0xFFFD69B7),
            onPressed: () {
              NavigationManager.instance.navigateToPage(path: '/register', arguments: 'nothing');
              print('gmail');
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 5, vertical: context.heightUnit * 1.5),
          child: doYouHaveAnAccount(context),
        ),
      ],
    ),
  );
}

TextStyle doYouTextStyle() => TextStyle();

RichText doYouHaveAnAccount(BuildContext context) => RichText(
        text: TextSpan(text: 'MAIN_SCREEN.DO_YOU_HAVE_AN_ACC'.tr(), style: Theme.of(context).textTheme.headline6, children: [
      TextSpan(
          text: 'MAIN_SCREEN.SIGN_IN'.tr(),
          style: Theme.of(context).textTheme.headline6?.copyWith(color: Palette.MBLUE),
          recognizer: TapGestureRecognizer()..onTap = () {}),
    ]));
