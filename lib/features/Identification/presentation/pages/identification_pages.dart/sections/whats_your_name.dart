import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/appetizers/textfield_error_rules.dart';
import 'package:matchangoo/core/components/buttons/textfield_with_error_scenario.dart';
import '../../../widgets/onboard_container_column.dart';
import '../../../../../../core/components/buttons/grey_textfield.dart';
import '../utils/onboard_text.dart';
import '../../../../../../core/components/utils/on_off_cubit.dart';
import '../../../../../../core/structure/utils/extensions/sizedBox_extension.dart';
import '../../../cubit/identification_cubit.dart';
import '../../../widgets/activatable_button.dart';

class WhatIsYourName extends StatefulWidget {
  const WhatIsYourName({Key? key}) : super(key: key);

  @override
  State<WhatIsYourName> createState() => _WhatIsYourNameState();
}

class _WhatIsYourNameState extends State<WhatIsYourName> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    _nameController = TextEditingController(text: context.read<IdentificationCubit>().registrationEntity.getNameIfNotEmpty);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OnOffCubit(initialState: _nameController.text.length > 2),
        child: Builder(
          builder: (context) => onboardContainerColumn(context: context, children: [
            onBoardText('WHAT_IS_YOUR_NAME.WIYN'.tr(), context),
            SizedBox().heightSpacer(context, 2),
            Text('first_string').tr(),
            Text(
              'WHAT_IS_YOUR_NAME.EXPLANATION'.tr(),
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black54),
            ),
            SizedBox().heightSpacer(context, 2),
            TextFieldContainerWController(
              errorRule: nameTextFieldErrorRole,
              controller: _nameController,
              autoFocus: true,
              focusNode: FocusNode(),
              textAlign: TextAlign.left,
              textInputType: TextInputType.emailAddress,
              hintText: 'WHAT_IS_YOUR_NAME.NAME_HINT'.tr(),
              onChanged: (name) {
                print(name);
                if (name.length > 2) {
                  print('felan yani.');
                  BlocProvider.of<OnOffCubit>(context).on();
                  BlocProvider.of<IdentificationCubit>(context).registrationEntity.name = name;
                } else {
                  print('felan yani.2');
                  BlocProvider.of<OnOffCubit>(context).off();
                }
              },
            ),
            SizedBox().heightSpacer(context, 2),
            activatableButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  context.read<IdentificationCubit>().goToNextPage();
                },
                shouldBeActive: _nameController.text.length > 2)
          ]),
        ));
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
