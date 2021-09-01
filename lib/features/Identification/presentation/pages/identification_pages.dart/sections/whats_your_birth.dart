import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/buttons/grey_textfield.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification_pages.dart/utils/focusnode_supplier.dart';
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
  final FocusNoder focusNoder;
  const WhenIsYourBirthday({Key? key, required this.focusNoder}) : super(key: key);

  static const WhatIsYourBD = "What is your Birthday ?";
  static const explanation = "This will be visible to other users , and used for matching purposes.";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnOffCubit(),
      child: SingleChildScrollView(child: Builder(
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 3, vertical: context.heightUnit * 4),
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
                birthdayTextFields(context),
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

  Row birthdayTextFields(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ourTextField(context, 0, 'DD'),
        ),
        SizedBox().widthSpacer(context, 2),
        Expanded(
          flex: 1,
          child: ourTextField(context, 1, 'MM'),
        ),
        SizedBox().widthSpacer(context, 2),
        Expanded(
          flex: 2,
          child: ourTextField(context, 2, 'YYYY'),
        ),
      ],
    );
  }

  Container ourTextField(BuildContext context, int field, String hint) {
    return textFieldContainer(
      context: context,
      maxLength: hint == "YYYY" ? 4 : 2,
      autoFocus: hint == "DD" ? true : false,
      focusNode: focusNoder.myFocus(field),
      hintStyle: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black38) ?? TextStyle(),
      textInputType: TextInputType.number,
      hintText: hint,
      onChanged: (string) {
        if (string.isNotEmpty) {
          if (shouldGoNextField(field, string)) {
            focusNoder.nextFocus(field).requestFocus();
          }
          if (field == 2) {
            print('evet field 2');
            focusNoder.myFocus(2).unfocus();
            context.read<OnOffCubit>().on();
          }
        } else {}
      },
    );
  }

  /*
   if (string.isNotEmpty) {
                if (shouldGoNextField(field, string)) {
                  context.read<IdentificationCubit>().focusNoder.nextFocus(field).requestFocus();
                }
                if (field == 7) {
                  context.read<IdentificationCubit>().focusNoder.nextFocus(7).unfocus();
                  context.read<OnOffCubit>().on();
                }
              } else {}
  */
}
