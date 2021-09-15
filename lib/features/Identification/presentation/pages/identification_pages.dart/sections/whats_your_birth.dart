import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/appetizers/textfield_rules/birthday_error_rule.dart';
import 'package:matchangoo/core/components/buttons/textfield_with_error_scenario.dart';
import '../../../widgets/onboard_container_column.dart';
import '../utils/onboard_text.dart';
import '../../../../../../core/components/utils/on_off_cubit.dart';
import '../../../../../../core/structure/utils/extensions/sizedbox_extension.dart';
import '../../../cubit/identification_cubit.dart';
import '../../../widgets/activatable_button.dart';

class WhenIsYourBirthday extends StatefulWidget {
  const WhenIsYourBirthday({Key? key}) : super(key: key);

  @override
  State<WhenIsYourBirthday> createState() => _WhenIsYourBirthdayState();
}

class _WhenIsYourBirthdayState extends State<WhenIsYourBirthday> {
  late final TextEditingController controllerOne;
  late final TextEditingController controllerTwo;
  late final TextEditingController controllerThree;

  @override
  void initState() {
    controllerOne = TextEditingController();
    controllerTwo = TextEditingController();
    controllerThree = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OnOffCubit(),
        child: Builder(
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
                context.read<IdentificationCubit>().registrationEntity.setBirthday(controllerOne.text, controllerTwo.text, controllerThree.text);
                context.read<IdentificationCubit>().goToNextPage();
              })
            ]);
          },
        ));
  }

  Row birthdayTextFields(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ourTextField(context, field: 0, hint: 'WHAT_IS_YOUR_BIRTHDAY.DD'.tr(), controller: controllerOne),
        ),
        SizedBox().widthSpacer(context, 2),
        Expanded(
          flex: 1,
          child: ourTextField(context, field: 1, hint: 'WHAT_IS_YOUR_BIRTHDAY.MM'.tr(), controller: controllerTwo),
        ),
        SizedBox().widthSpacer(context, 2),
        Expanded(
          flex: 2,
          child: ourTextField(context, field: 2, hint: 'WHAT_IS_YOUR_BIRTHDAY.YYYY'.tr(), controller: controllerThree),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controllerOne.dispose();
    controllerTwo.dispose();
    controllerThree.dispose();
    super.dispose();
  }
}

Widget ourTextField(BuildContext context, {required int field, required String hint, required TextEditingController controller}) {
  return TextFieldContainerWController(
    maxLength: hint == "YYYY" ? 4 : 2,
    controller: controller,
    errorRule: boolReturnes[field],
    autoFocus: field == 0 ? true : false,
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
        } else {
          context.read<OnOffCubit>().off();
        }
      }
    },
  );
}
