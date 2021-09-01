import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/utils/on_off_cubit.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/features/Identification/presentation/cubit/gender_cubit.dart';
import 'package:matchangoo/features/Identification/presentation/cubit/identification_cubit.dart';
import 'package:matchangoo/features/Identification/presentation/cubit/profession_cubit.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification_pages.dart/utils/onboard_text.dart';

import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';
import 'package:matchangoo/features/Identification/presentation/widgets/activatable_button.dart';
import 'package:matchangoo/features/Identification/presentation/widgets/gender_grey_button.dart';

class Profession extends StatelessWidget {
  const Profession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => context.read<IdentificationCubit>().professionCubit,
        ),
        BlocProvider(
          create: (context) => OnOffCubit(),
        ),
      ],
      child: BlocBuilder<ProfessionCubit, ProfessionType>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 3, vertical: context.heightUnit * 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                onBoardText('Profession?', context),
                Text(
                  'Your age will be public',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox().heightSpacer(context, 2),
                buttonsRow(context, state),
                SizedBox().heightSpacer(context, 2),
                activatableButton(onPressed: () {
                  context.read<IdentificationCubit>().goToNextPage();
                })
              ],
            ),
          );
        },
      ),
    );
  }

  Row buttonsRow(BuildContext context, ProfessionType state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: GestureDetector(
                onTap: () {
                  context.read<ProfessionCubit>().changeProfession(ProfessionType.STUDENT);
                  context.read<OnOffCubit>().on();
                },
                child: genderGreyButton(isActive: state == ProfessionType.STUDENT ? true : false, text: 'Woman', context: context))),
        SizedBox().widthSpacer(context, 2),
        Expanded(
            child: GestureDetector(
                onTap: () {
                  context.read<ProfessionCubit>().changeProfession(ProfessionType.WORKER);
                  context.read<OnOffCubit>().on();
                },
                child: genderGreyButton(isActive: state == ProfessionType.WORKER ? true : false, text: 'Man', context: context))),
      ],
    );
  }
}
