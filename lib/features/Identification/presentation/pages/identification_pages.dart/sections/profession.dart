import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/features/Identification/presentation/widgets/onboard_container_column.dart';
import '../../../../../../core/components/utils/on_off_cubit.dart';
import '../../../../../../core/structure/utils/extensions/context_extension.dart';
import '../../../cubit/gender_cubit.dart';
import '../../../cubit/identification_cubit.dart';
import '../../../cubit/profession_cubit.dart';
import '../../identification.dart';
import '../utils/onboard_text.dart';

import '../../../../../../core/structure/utils/extensions/sizedBox_extension.dart';
import '../../../widgets/activatable_button.dart';
import '../../../widgets/gender_grey_button.dart';

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
          return onboardContainerColumn(context: context, children: [
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
          ]);
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
                child: genderGreyButton(isActive: state == ProfessionType.STUDENT ? true : false, text: 'Student', context: context))),
        SizedBox().widthSpacer(context, 2),
        Expanded(
            child: GestureDetector(
                onTap: () {
                  context.read<ProfessionCubit>().changeProfession(ProfessionType.WORKER);
                  context.read<OnOffCubit>().on();
                },
                child: genderGreyButton(isActive: state == ProfessionType.WORKER ? true : false, text: 'Working', context: context))),
      ],
    );
  }
}
