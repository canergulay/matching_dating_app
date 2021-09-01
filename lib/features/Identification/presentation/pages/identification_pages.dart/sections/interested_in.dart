import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/buttons/grey_button.dart';
import 'package:matchangoo/core/components/utils/on_off_cubit.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';
import 'package:matchangoo/features/Identification/presentation/cubit/identification_cubit.dart';
import 'package:matchangoo/features/Identification/presentation/cubit/interested_cubit.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification_pages.dart/utils/onboard_text.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';
import 'package:matchangoo/features/Identification/presentation/widgets/activatable_button.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnOffCubit()),
        BlocProvider(create: (context) => context.read<IdentificationCubit>().interestedInCubit)
      ],
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 3, vertical: context.heightUnit * 4),
        child: BlocBuilder<InterestedInCubit, InterestedState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                onBoardText('Interested in?', context),
                SizedBox().heightSpacer(context, 3),
                buttonsRow(context, state),
                SizedBox().heightSpacer(context, 3),
                activatableButton(onPressed: () => context.read<IdentificationCubit>().goToNextPage())
              ],
            );
          },
        ),
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

          print('bastın');
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
