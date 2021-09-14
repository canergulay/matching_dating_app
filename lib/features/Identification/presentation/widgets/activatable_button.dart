import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/ui/theme/palette.dart';
import '../../../../core/components/buttons/animated_button.dart';
import '../../../../core/components/utils/on_off_cubit.dart';

import 'package:flutter/material.dart';

Widget activatableButton({required VoidCallback onPressed, bool shouldBeActive = false}) => BlocBuilder<OnOffCubit, bool>(
      builder: (context, state) {
        if (shouldBeActive && state) {
          return activeButton(onPressed);
        } else if (!state) {
          return inActiveButton();
        } else {
          return activeButton(onPressed);
        }
      },
    );

AnimatedButton activeButton(VoidCallback onPressed) {
  return AnimatedButton(
    title: 'next',
    onPressed: onPressed,
    buttonColor: Palette.MPINK,
    child: Icon(
      Icons.navigate_next,
      color: Colors.white,
    ),
  );
}

Center inActiveButton() {
  return Center(
      child: AnimatedButton(
    title: 'NEXT'.tr(),
    onPressed: () {},
    buttonColor: Palette.BUTTONINACTIVE,
    child: Icon(
      Icons.navigate_next,
      color: Colors.white,
    ),
  ));
}
