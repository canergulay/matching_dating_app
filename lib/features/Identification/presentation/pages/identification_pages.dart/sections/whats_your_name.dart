import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/components/buttons/animated_button.dart';
import '../../../../../../core/components/utils/on_off_cubit.dart';
import '../../../../../../core/structure/utils/extensions/context_extension.dart';
import '../../../../../../core/structure/utils/extensions/sizedBox_extension.dart';
import '../../../../../../core/structure/utils/extensions/textstyle_extension.dart';
import '../../../../../../core/ui/components/headlines.dart';
import '../../../cubit/identification_cubit.dart';
import '../../../widgets/activatable_button.dart';

class WhatIsYourName extends StatelessWidget {
  const WhatIsYourName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusNode _focusNode = FocusNode();
    final String whatIsYourName = 'What is your name ?';
    final String explanation = '* This will be shown to other users and you will not be allowed to change.';
    return BlocProvider(
        create: (context) => OnOffCubit(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 8, vertical: context.heightUnit * 3),
            child: Builder(
              builder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox().heightSpacer(context, 2),
                  headLineTwo(context, whatIsYourName),
                  SizedBox().heightSpacer(context, 1),
                  Text(
                    explanation,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black54),
                  ),
                  SizedBox().heightSpacer(context, 2),
                  TextField(
                      focusNode: _focusNode,
                      onChanged: (name) {
                        if (name.length > 2) {
                          BlocProvider.of<OnOffCubit>(context).on();
                          BlocProvider.of<IdentificationCubit>(context).registrationEntity.name = name;
                        } else {
                          BlocProvider.of<OnOffCubit>(context).off();
                        }
                      },
                      autofocus: true,
                      style: Theme.of(context).textTheme.headline3?.dynamicText(size: 7, context: context),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelStyle: Theme.of(context).textTheme.headline3!.dynamicText(size: 3, context: context),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                        ),
                      )),
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
