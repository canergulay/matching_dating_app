import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/appetizers/enums.dart/auth_type.enum.dart';
import 'package:matchangoo/core/appetizers/textfield_rules/email_password_rule.dart';
import 'package:matchangoo/core/components/buttons/grey_textfield.dart';
import 'package:matchangoo/core/components/buttons/obscure_dynamic_textfield.dart';
import 'package:matchangoo/core/components/texts/auto_size_titles.dart';
import 'package:matchangoo/core/components/utils/on_off_cubit.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';
import 'package:matchangoo/core/ui/components/headlines.dart';
import 'package:matchangoo/features/authentication/register/presentation/widgets/activatable_button.dart';
import 'package:matchangoo/features/authentication/register/presentation/widgets/white_containerwpinkshadow.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';

class AuthContainer extends StatefulWidget {
  final Function(String email, String password) buttonPressed;
  final String explanation;
  final AuthType authType;
  const AuthContainer({Key? key, required this.authType, required this.buttonPressed, required this.explanation}) : super(key: key);

  @override
  _AuthContainerState createState() => _AuthContainerState();
}

class _AuthContainerState extends State<AuthContainer> {
  bool isButtonOpen = false;
  String mail = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return WhiteContainerWPinkShadow(
        padding: context.heightUnit * 3,
        child: BlocProvider(
          create: (context) => OnOffCubit(),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox().heightSpacer(context, 1),
            sampleTitle(
              context,
              title: 'EMAIL_VERIFICATION.TITLE_TEXT'.tr(),
            ),
            sampleTitle(
              context,
              title: 'EMAIL_VERIFICATION.TITLE_TEXT2'.tr(),
            ),
            textFieldContainerWithPrefix(
              context: context,
              textInputType: TextInputType.emailAddress,
              hintText: 'EMAIL_VERIFICATION.MAIL_HINT'.tr(),
              preffixIcon: Icons.mail_outline_outlined,
              onChanged: (text) {
                mail = text;
                if (emailPassController(email: mail, password: password)) {
                  openButton();
                } else {
                  closeButton();
                }
              },
            ),
            ObscureDynamicTextfield(
              textInputType: TextInputType.text,
              preffixIcon: Icons.lock,
              hintText: 'EMAIL_VERIFICATION.PASSWORD_HINT'.tr(),
              onChanged: (text) {
                password = text;
                if (emailPassController(email: mail, password: password)) {
                  openButton();
                } else {
                  closeButton();
                }
              },
              //onChanged: (text) => context.read<RegisterBloc>().add(EmailAdressTyped(emailAdressChanged: text))
            ),
            forgetPassOrSizedBox(context, type: widget.authType),
            const SizedBox().heightSpacer(context, 2),
            getAnimatedButton(
              isButtonOpen,
              context,
              () {
                widget.buttonPressed(mail, password);
              },
            ),
            const SizedBox().heightSpacer(context, 1),
            Text(widget.explanation),
          ]),
        ));
  }

  void openButton() {
    setState(() {
      isButtonOpen = true;
    });
  }

  void closeButton() {
    setState(() {
      isButtonOpen = false;
    });
  }
}

Widget forgetPassOrSizedBox(BuildContext context, {required AuthType type}) {
  if (type == AuthType.login) {
    return Padding(
      padding: EdgeInsets.only(top: context.heightUnit * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          headLineEight(context, 'LOGIN.FP'.tr()),
        ],
      ),
    );
  } else {
    return const SizedBox();
  }
}
