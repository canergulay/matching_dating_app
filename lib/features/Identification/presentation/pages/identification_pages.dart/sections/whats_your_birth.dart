import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/buttons/grey_textfield.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification_pages.dart/utils/onboard_text.dart';
import '../../../../../../core/components/utils/on_off_cubit.dart';
import '../../../../../../core/constants/controllers/date_validator_controller.dart';
import '../../../../../../core/structure/utils/extensions/context_extension.dart';
import '../../../../../../core/structure/utils/extensions/sizedBox_extension.dart';
import '../../../../../../core/ui/components/headlines.dart';
import '../../../cubit/identification_cubit.dart';
import '../utils/bool_checkers.dart';
import '../../../widgets/activatable_button.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';

class WhenIsYourBirthday extends StatelessWidget {
  const WhenIsYourBirthday({Key? key}) : super(key: key);

  static const WhatIsYourBD = "What is your Birthday ?";
  static const explanation = "This will be visible to other users , and used for matching purposes.";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnOffCubit(),
      child: SingleChildScrollView(child: Builder(
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 3, vertical: context.heightUnit * 1.5),

            //padding: EdgeInsets.only(left: context.widthUnit * 4, right: context.widthUnit * 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                onBoardText(WhatIsYourBD, context),
                SizedBox().heightSpacer(context, 2),
                Text(
                  explanation,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black45),
                ),
                SizedBox().heightSpacer(context, 2),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: textFieldContainer(
                        context: context,
                        autoFocus: true,
                        hintStyle: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black38) ?? TextStyle(),
                        textInputType: TextInputType.number,
                        hintText: 'DD',
                        onChanged: (name) {},
                      ),
                    ),
                    SizedBox().widthSpacer(context, 2),
                    Expanded(
                      flex: 1,
                      child: textFieldContainer(
                        context: context,
                        autoFocus: true,
                        hintStyle: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black38) ?? TextStyle(),
                        textInputType: TextInputType.number,
                        hintText: 'MM',
                        onChanged: (name) {},
                      ),
                    ),
                    SizedBox().widthSpacer(context, 2),
                    Expanded(
                      flex: 2,
                      child: textFieldContainer(
                        context: context,
                        autoFocus: true,
                        hintStyle: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black38) ?? TextStyle(),
                        textInputType: TextInputType.number,
                        hintText: 'YYYY',
                        onChanged: (name) {},
                      ),
                    ),
                  ],
                ),
                wholeTextField(context),
                SizedBox().heightSpacer(context, 2),
                activatableButton(onPressed: () {
                  context.read<IdentificationCubit>().goToNextPage();
                })
              ],
            ),
          );
        },
      )),
    );
  }

  Row wholeTextField(BuildContext context) {
    return Row(
      children: [
        Spacer(
          flex: 10,
        ),
        digitTextField(0, context, 'D', DateValidatorRegexper.dayRegFirst),
        Spacer(
          flex: 1,
        ),
        digitTextField(1, context, 'D', DateValidatorRegexper.dayRegexpSecond),
        Spacer(
          flex: 3,
        ),
        Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: headLineThree(context, '/'),
            )),
        Spacer(
          flex: 3,
        ),
        digitTextField(2, context, 'M', DateValidatorRegexper.monthRegexpFirst),
        Spacer(
          flex: 1,
        ),
        digitTextField(3, context, 'M', DateValidatorRegexper.monthRegexpSecond),
        Spacer(
          flex: 3,
        ),
        Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: headLineThree(context, '/'),
            )),
        Spacer(
          flex: 3,
        ),
        digitTextField(4, context, 'Y', DateValidatorRegexper.yearRegexpFirst),
        Spacer(
          flex: 1,
        ),
        digitTextField(5, context, 'Y', DateValidatorRegexper.yearRegexpSecond),
        Spacer(
          flex: 1,
        ),
        digitTextField(6, context, 'Y', DateValidatorRegexper.yearRegexpLastTwo),
        Spacer(
          flex: 1,
        ),
        digitTextField(7, context, 'Y', DateValidatorRegexper.yearRegexpLastTwo),
        Spacer(
          flex: 10,
        ),
      ],
    );
  }

  Expanded digitTextField(int field, BuildContext context, String hint, RegExp regexp) {
    return Expanded(
        flex: 5,
        child: RawKeyboardListener(
          focusNode: FocusNode(),
          onKey: (event) {
            if (event.logicalKey == LogicalKeyboardKey.backspace && field != 0) {
              print(field.toString() + 'deneme');
              // here you can check if textfield is focused
              // context.read<IdentificationCubit>().focusNoder.myFocus(field).unfocus();
              context.read<IdentificationCubit>().focusNoder.previousFocus(field).requestFocus();
            }
          },
          child: TextField(
            focusNode: context.read<IdentificationCubit>().focusNoder.myFocus(field),
            style: Theme.of(context).textTheme.headline5,
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black38),
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.allow(regexp),
            ],
            keyboardType: TextInputType.number,
            onChanged: (string) {
              if (string.isNotEmpty) {
                if (shouldGoNextField(field, string)) {
                  context.read<IdentificationCubit>().focusNoder.nextFocus(field).requestFocus();
                }
                if (field == 7) {
                  context.read<IdentificationCubit>().focusNoder.nextFocus(7).unfocus();
                  context.read<OnOffCubit>().on();
                }
              } else {}
            },
          ),
        ));
  }
}
