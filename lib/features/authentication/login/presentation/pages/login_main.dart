import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:matchangoo/core/constants/app_constants.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';
import 'package:matchangoo/core/structure/utils/widgets/background_widget_wlogo.dart';
import 'package:matchangoo/core/ui/components/headlines.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';
import '../../../../../core/components/buttons/animated_button.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import '../../../../../core/structure/navigation/navigation_manager.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';

class LoginMain extends StatelessWidget {
  const LoginMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundContainerWithLogo(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
          child: headLineThree(context, 'Join ${AppConstants.APP_NAME} and find your partner on a common criteria!'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 5, vertical: context.heightUnit * 1.5),
          child: AnimatedButton(
            buttonRadius: 15,
            title: 'Create an account',
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
        text: TextSpan(text: 'Do you have an account ?', style: Theme.of(context).textTheme.headline6, children: [
      TextSpan(
          text: ' Sign In',
          style: Theme.of(context).textTheme.headline6?.copyWith(color: Palette.MBLUE),
          recognizer: TapGestureRecognizer()..onTap = () {}),
    ]));
