import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/onboard_container_column.dart';
import '../../../../../../core/components/utils/on_off_cubit.dart';

import '../../../cubit/gender_cubit.dart';
import '../../../cubit/identification_cubit.dart';
import '../utils/onboard_text.dart';
import '../../../../../../core/structure/utils/extensions/sizedBox_extension.dart';
import '../../../widgets/activatable_button.dart';
import '../../../widgets/gender_grey_button.dart';

class FirstSection extends StatelessWidget {
  const FirstSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => context.read<IdentificationCubit>().genderCubit),
        BlocProvider(create: (context) => OnOffCubit())
      ],
      child: BlocBuilder<GenderCubit, GenderType>(
        builder: (context, state) {
          return onboardContainerColumn(context: context, children: [
            onBoardText('I am a'.tr(), context),
            SizedBox().heightSpacer(context, 2),
            Text(
              'Your age will be public'.tr(),
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

  Row buttonsRow(BuildContext context, GenderType state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: GestureDetector(
                onTap: () {
                  context.read<GenderCubit>().changeGender(GenderType.WOMAN);
                  context.read<OnOffCubit>().on();
                },
                child: genderGreyButton(isActive: state == GenderType.WOMAN ? true : false, text: 'GENDERS.WOMAN'.tr(), context: context))),
        SizedBox().widthSpacer(context, 2),
        Expanded(
            child: GestureDetector(
                onTap: () {
                  context.read<GenderCubit>().changeGender(GenderType.MAN);
                  context.read<OnOffCubit>().on();
                },
                child: genderGreyButton(isActive: state == GenderType.MAN ? true : false, text: 'GENDERS.MAN'.tr(), context: context))),
      ],
    );
  }
}
