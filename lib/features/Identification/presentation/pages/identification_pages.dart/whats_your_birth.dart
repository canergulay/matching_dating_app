import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/utils/on_off_cubit.dart';
import 'package:matchangoo/core/constants/controllers/date_validator_controller.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/core/structure/utils/extensions/focus_passer_extension.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';
import 'package:matchangoo/core/ui/components/headlines.dart';
import 'package:matchangoo/features/Identification/presentation/cubit/identification_cubit.dart';
import 'package:matchangoo/features/Identification/presentation/widgets/activatable_button.dart';

class WhenIsYourBirthday extends StatelessWidget {
  const WhenIsYourBirthday({Key? key}) : super(key: key);

  static const WhatIsYourBD = "What is your Birthday ?";
  static const explanation = "* This will be visible to other users , and used for matching purposes.";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnOffCubit(),
      child: SingleChildScrollView(child: Builder(
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 8, vertical: context.heightUnit * 3),
            //padding: EdgeInsets.only(left: context.widthUnit * 4, right: context.widthUnit * 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headLineTwo(context, WhatIsYourBD),
                Text(
                  explanation,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black45),
                ),
                SizedBox().heightSpacer(context, 2),
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
        child: TextField(
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
                context.nextEditableTextFocus();
              }
              if (field == 7) {
                context.finishAndUnfocus();
                context.read<OnOffCubit>().on();
              }
            }
          },
        ));
  }
}

bool shouldGoNextField(int field, String value) {
  print('HERE IS THE VALUE ' + value);
  switch (field) {
    case 0:
      return kontrolForZero(int.parse(value));
    case 2:
      return kontrolForSecond(int.parse(value));
    case 3:
      return kontrolForThird(int.parse(value));
    case 4:
      return kontrolForForth(int.parse(value));
    case 5:
      return kontrolForFifth(int.parse(value));
    default:
      return true;
  }
}

bool kontrolForZero(int value) {
  return value <= 3;
}

bool kontrolForSecond(int value) {
  return value == 0 || value == 1;
}

bool kontrolForThird(int value) {
  return value < 3;
}

bool kontrolForForth(int value) {
  return value == 1 || value == 2;
}

bool kontrolForFifth(int value) {
  return value == 8 || value == 9 || value == 0;
}
