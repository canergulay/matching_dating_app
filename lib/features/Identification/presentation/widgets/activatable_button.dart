import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/buttons/animated_button.dart';
import 'package:matchangoo/core/components/utils/on_off_cubit.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';

import 'package:flutter/material.dart';
import 'package:matchangoo/core/ui/components/headlines.dart';

Widget activatableButton({required VoidCallback onPressed}) => BlocBuilder<OnOffCubit, bool>(
      builder: (context, state) {
        if (!state) {
          return Center(
              child: Column(
            children: [
              SizedBox().heightSpacer(context, 2),
              Container(child: headLineThree(context, 'continue')),
            ],
          ));
        } else {
          return AnimatedButton(title: 'continue', onPressed: onPressed);
        }
      },
    );
