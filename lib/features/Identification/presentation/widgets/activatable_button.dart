import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';
import '../../../../core/components/buttons/animated_button.dart';
import '../../../../core/components/utils/on_off_cubit.dart';
import '../../../../core/structure/utils/extensions/sizedBox_extension.dart';

import 'package:flutter/material.dart';
import '../../../../core/ui/components/headlines.dart';

Widget activatableButton({required VoidCallback onPressed}) => BlocBuilder<OnOffCubit, bool>(
      builder: (context, state) {
        if (!state) {
          return Center(
              child: AnimatedButton(
            title: 'next',
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
