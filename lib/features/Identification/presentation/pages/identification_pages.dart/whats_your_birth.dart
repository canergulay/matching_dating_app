import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matchangoo/core/constants/controllers/date_validator_controller.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/core/structure/utils/extensions/focus_passer_extension.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';
import 'package:matchangoo/core/ui/components/headlines.dart';

class WhenIsYourBirthday extends StatelessWidget {
  const WhenIsYourBirthday({Key? key}) : super(key: key);

  static const WhatIsYourBD = "What is your Birthday ?";
  static const explanation = "* This will be visible to other users , and used for matching purposes.";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: context.widthUnit * 4, right: context.widthUnit * 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          headLineTwo(context, WhatIsYourBD),
          Text(
            explanation,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black45),
          ),
          SizedBox().heightSpacer(context, 2),
          wholeTextField(context),
          SizedBox().heightSpacer(context, 2)
        ],
      ),
    );
  }

  Row wholeTextField(BuildContext context) {
    return Row(
      children: [
        Spacer(
          flex: 10,
        ),
        digitTextField(false, context, 'D', DateValidatorRegexper.dayRegexp),
        Spacer(
          flex: 1,
        ),
        digitTextField(false, context, 'D', DateValidatorRegexper.dayRegexp),
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
        digitTextField(false, context, 'M', DateValidatorRegexper.monthRegexpFirst),
        Spacer(
          flex: 1,
        ),
        digitTextField(false, context, 'M', DateValidatorRegexper.monthRegexpSecond),
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
        digitTextField(false, context, 'Y', DateValidatorRegexper.yearRegexpFirst),
        Spacer(
          flex: 1,
        ),
        digitTextField(false, context, 'Y', DateValidatorRegexper.yearRegexpSecond),
        Spacer(
          flex: 1,
        ),
        digitTextField(false, context, 'Y', DateValidatorRegexper.yearRegexpLastTwo),
        Spacer(
          flex: 1,
        ),
        digitTextField(true, context, 'Y', DateValidatorRegexper.yearRegexpLastTwo),
        Spacer(
          flex: 10,
        ),
      ],
    );
  }

  Expanded digitTextField(bool isLast, BuildContext context, String hint, RegExp regexp) {
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
            !isLast ? context.nextEditableTextFocus() : context.finishAndUnfocus();
          },
        ));
  }
}

bool checkForMonthFirst(String month) {
  return month == "0" || month == "1";
}
