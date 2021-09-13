import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/onboard_container_column.dart';
import '../../../../../../core/components/buttons/grey_textfield.dart';
import '../utils/focusnode_supplier.dart';
import '../utils/onboard_text.dart';
import '../../../../../../core/components/utils/on_off_cubit.dart';
import '../../../../../../core/structure/utils/extensions/sizedBox_extension.dart';
import '../../../cubit/identification_cubit.dart';
import '../utils/bool_checkers.dart';
import '../../../widgets/activatable_button.dart';

class WhenIsYourBirthday extends StatelessWidget {
  final FocusNoder focusNoder;
  const WhenIsYourBirthday({Key? key, required this.focusNoder}) : super(key: key);

  static const WhastIsYourBD = "What is your Birthday ?";
  static const explsanation = "This will be visible to other users , and used for matching purposes.";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnOffCubit(),
      child: SingleChildScrollView(child: Builder(
        builder: (context) {
          return onboardContainerColumn(context: context, children: [
            onBoardText('WHAT_IS_YOUR_BIRTHDAY.WIYB'.tr(), context),
            SizedBox().heightSpacer(context, 2),
            Text(
              'WHAT_IS_YOUR_BIRTHDAY.EXPLANATION'.tr(),
              style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black45),
            ),
            SizedBox().heightSpacer(context, 2),
            birthdayTextFields(context),
            SizedBox().heightSpacer(context, 2),
            activatableButton(onPressed: () {
              FocusScope.of(context).unfocus();
              context.read<IdentificationCubit>().goToNextPage();
            })
          ]);
        },
      )),
    );
  }

  Row birthdayTextFields(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ourTextField(context, 0, 'WHAT_IS_YOUR_BIRTHDAY.DD'.tr()),
        ),
        SizedBox().widthSpacer(context, 2),
        Expanded(
          flex: 1,
          child: ourTextField(context, 1, 'WHAT_IS_YOUR_BIRTHDAY.MM'.tr()),
        ),
        SizedBox().widthSpacer(context, 2),
        Expanded(
          flex: 2,
          child: ourTextField(context, 2, 'WHAT_IS_YOUR_BIRTHDAY.YYYY'.tr()),
        ),
      ],
    );
  }

  Container ourTextField(BuildContext context, int field, String hint) {
    return textFieldContainer(
      context: context,
      maxLength: hint == "YYYY" ? 4 : 2,
      autoFocus: field == 0 ? true : false,
      focusNode: focusNoder.myFocus(field),
      hintStyle: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black38) ?? TextStyle(),
      textInputType: TextInputType.number,
      hintText: hint,
      onChanged: (string) {
        if (string.isNotEmpty) {
          if (shouldGoNextField(field, string)) {
            // FIRSTLY, WE WILL CHECK IF WE SHOULD PASS THIS FIELD,
            // WHETHER IT HOLDS THE RULES OF THE FORMAT.
            if (field < 2) {
              // IF IT IS THE ZER0TH OR FIRST FIELD, WE WILL SWITCH TO THE FOLLOWING TEXTFIELD
              FocusScope.of(context).nextFocus();
            } else {
              // IF IT IS THE LAST FIELD , WE WILL UNFOCUS AND ACTIVATE THE NEXT BUTTON
              FocusScope.of(context).unfocus();
              context.read<OnOffCubit>().on();
            }
          }
        }
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
