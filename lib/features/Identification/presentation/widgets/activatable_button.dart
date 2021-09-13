import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/ui/theme/palette.dart';
import '../../../../core/components/buttons/animated_button.dart';
import '../../../../core/components/utils/on_off_cubit.dart';

import 'package:flutter/material.dart';

Widget activatableButton({required VoidCallback onPressed, bool shouldBeActive = false}) => BlocBuilder<OnOffCubit, bool>(
      builder: (context, state) {
        if (!state && !shouldBeActive) {
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
        } else {
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
      },
    );
