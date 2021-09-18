import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/features/Identification/data/models/interested_in_type.dart';
import '../../../widgets/onboard_container_column.dart';
import '../../../../../../core/components/buttons/grey_button.dart';
import '../../../../../../core/components/utils/on_off_cubit.dart';
import '../../../../../../core/constants/asset_paths.dart';
import '../../../../../../core/ui/theme/palette.dart';
import '../../../cubit/identification_cubit.dart';
import '../../../cubit/interested_cubit.dart';
import '../utils/onboard_text.dart';
import '../../../../../../core/structure/utils/extensions/context_extension.dart';
import '../../../../../../core/structure/utils/extensions/sizedbox_extension.dart';
import '../../../widgets/activatable_button.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnOffCubit()),
        BlocProvider(create: (context) => context.read<IdentificationCubit>().interestedInCubit)
      ],
      child: BlocBuilder<InterestedInCubit, InterestedState>(
        builder: (context, state) {
          return onboardContainerColumn(context: context, children: [
            onBoardText('INTERESTED_IN'.tr(), context),
            SizedBox().heightSpacer(context, 3),
            buttonsRow(context, state),
            SizedBox().heightSpacer(context, 3),
            activatableButton(onPressed: () {
              context.read<InterestedInCubit>().deleteNone();
              context.read<IdentificationCubit>().goToNextPage();
              context.read<IdentificationCubit>().registrationEntity.setInterestedIns = (state as InterestedChoosen).genders;
            })
          ]);
        },
      ),
    );
  }

  Row buttonsRow(BuildContext context, InterestedState state) {
    return Row(
      children: [
        Expanded(child: interestedInContainer(context, (state as InterestedChoosen).genders, InterestedType.MAN)),
        SizedBox().widthSpacer(context, 3),
        Expanded(child: interestedInContainer(context, state.genders, InterestedType.WOMAN))
      ],
    );
  }

  GestureDetector interestedInContainer(BuildContext context, List<InterestedType> interests, InterestedType myType) => GestureDetector(
        onTap: () {
          bool isGendersChoosen = context.read<InterestedInCubit>().changeInterests(myType);
          if (isGendersChoosen) {
            context.read<OnOffCubit>().on();
          } else {
            context.read<OnOffCubit>().off();
          }
        },
        child: Stack(
          children: [
            greyContainer(
              padding: context.heightUnit * 5,
              rightPadding: context.heightUnit * 5,
              color: Palette.TEXTFIELDGREY,
              child: myIcon(myType),
            ),
            Positioned(right: context.heightUnit, top: context.heightUnit, child: selectedIcon(interests, myType)),
          ],
        ),
      );
}

Image selectedIcon(List<InterestedType> interests, InterestedType myType) {
  if (interests.contains(myType)) {
    return Image.asset(
      AssetPaths.STATUS_PREVIOUS,
      scale: 2,
    );
  } else {
    return Image.asset(
      AssetPaths.STATUS_FUTURE,
      scale: 2,
    );
  }
}

Image myIcon(InterestedType myType) {
  if (myType == InterestedType.MAN) {
    return Image.asset(AssetPaths.MAN);
  } else {
    return Image.asset(AssetPaths.WOMAN);
  }
}
