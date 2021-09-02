import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    FocusNode _focusNode = FocusNode();
    final String whatIsYourName = 'What is your name ?';
    final String explanation = 'Your name will be visible to other users.';
    return BlocProvider(
        create: (context) => OnOffCubit(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 3, vertical: context.heightUnit * 1.5),
            child: Builder(
              builder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox().heightSpacer(context, 2),
                  onBoardText(whatIsYourName, context),
                  SizedBox().heightSpacer(context, 2),
                  Text(
                    explanation,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black54),
                  ),
                  SizedBox().heightSpacer(context, 2),
                  textFieldContainer(
                    context: context,
                    autoFocus: true,
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
                  activatableButton(onPressed: () {
                    _focusNode.unfocus();
                    context.read<IdentificationCubit>().goToNextPage();
                  })
                ],
              ),
            ),
          ),
        ));
  }
}
