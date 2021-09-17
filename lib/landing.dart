import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:matchangoo/core/appetizers/enums.dart/dialog_type_enum.dart';
import 'package:matchangoo/core/appetizers/enums.dart/toast_type_enum.dart';
import 'package:matchangoo/core/components/dialogs/error_dialog.dart';
import 'package:matchangoo/core/components/dialogs/show_dialog.dart';
import 'package:matchangoo/core/components/toasts/toast_manager.dart';
import 'package:matchangoo/core/components/toasts/toast_widgets.dart/general_toast.dart';
import 'core/constants/app_constants.dart';
import 'core/constants/asset_paths.dart';
import 'core/structure/utils/widgets/background_widget_wlogo.dart';
import 'core/structure/utils/widgets/logo.dart';
import 'core/ui/components/headlines.dart';
import 'core/ui/theme/palette.dart';
import 'core/components/buttons/animated_button.dart';
import 'core/structure/utils/extensions/context_extension.dart';
import 'core/structure/navigation/navigation_manager.dart';
import 'core/structure/utils/extensions/sizedbox_extension.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundContainerWithOutLogo(
        child: Column(
          children: [
            matchifyLogo(context),
            firstSectionMethod(context),
            const SizedBox().heightSpacer(context, 2),
            secondShit(context),
            const SizedBox().heightSpacer(context, 7),
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
            buttonColor: const Color(0xFFFD69B7),
            onPressed: () {
              ToastShower.instance.showMyToast(context, GeneralToast(type: ToastType.info));
              //NavigationManager.instance.navigateToPage(path: '/register', arguments: 'nothing');
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

TextStyle doYouTextStyle() => const TextStyle();

RichText doYouHaveAnAccount(BuildContext context) => RichText(
        text: TextSpan(text: 'MAIN_SCREEN.DO_YOU_HAVE_AN_ACC'.tr(), style: Theme.of(context).textTheme.headline6, children: [
      TextSpan(
          text: 'MAIN_SCREEN.SIGN_IN'.tr(),
          style: Theme.of(context).textTheme.headline6?.copyWith(color: Palette.MBLUE),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              NavigationManager.instance.navigateToPage(path: '/login', arguments: 'nothing');
              //showCustomInfoAlertDialog(context, title: 'ERROR.TITLES.ONE'.tr(), message: 'ERROR.MESSAGES.ONE'.tr(), dialogType: DialogType.info);
            }),
    ]));
