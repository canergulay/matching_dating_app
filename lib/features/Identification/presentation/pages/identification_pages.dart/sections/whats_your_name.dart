import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/features/Identification/presentation/widgets/onboard_container_column.dart';
import 'package:matchangoo/features/authentication/register/presentation/bloc/register_bloc.dart';
import '../../../../../../core/components/buttons/grey_textfield.dart';
import '../utils/onboard_text.dart';
import '../../../../../../core/components/utils/on_off_cubit.dart';
import '../../../../../../core/structure/utils/extensions/context_extension.dart';
import '../../../../../../core/structure/utils/extensions/sizedBox_extension.dart';
import '../../../cubit/identification_cubit.dart';
import '../../../widgets/activatable_button.dart';

class WhatIsYourName extends StatelessWidget {
  const WhatIsYourName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String whatIsYourName = 'What is your name ?';
    final String explanation = 'Your name will be visible to other users.';
    return BlocProvider(
        create: (context) => OnOffCubit(),
        child: SingleChildScrollView(
            child: Builder(
          builder: (context) => onboardContainerColumn(context: context, children: [
            onBoardText(whatIsYourName, context),
            SizedBox().heightSpacer(context, 2),
            Text(
              explanation,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black54),
            ),
            SizedBox().heightSpacer(context, 2),
            textFieldContainerWController(
              context: context,
              controller: TextEditingController(text: context.read<IdentificationCubit>().registrationEntity.getNameIfNotEmpty),
              autoFocus: true,
              focusNode: FocusNode(),
              textAlign: TextAlign.left,
              textInputType: TextInputType.emailAddress,
              hintText: 'Enter your full name',
              onChanged: (name) {
                if (name.length > 2) {
                  BlocProvider.of<OnOffCubit>(context).on();
                  BlocProvider.of<IdentificationCubit>(context).registrationEntity.name = name;
                } else {
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
                shouldBeActive: true)
          ]),
        )));
  }
}
