import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/buttons/animator_button.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';
import 'package:matchangoo/features/authenticated/home/presentation/bloc/bottom_navbar_cubit.dart';

Widget bottomNavigationBarItem(int index, BuildContext context, {required int myIndex}) => AnimatorButton(
      onPressed: () {
        context.read<BottomNavBarCubit>().changePage(myIndex);
      },
      childToBeAnimated: Image.asset(
        getNavbarIcon(myIndex),
        color: index == myIndex ? Palette.bottomBarItemWhite : Palette.bottomBarItemGrey,
        scale: 2.31,
      ),
      isOnPressedBeforeAnimation: true,
    );

String getNavbarIcon(int index) {
  switch (index) {
    case 0:
      return AssetPaths.shared.match;
    case 1:
      return AssetPaths.shared.settings;
    case 2:
      return AssetPaths.shared.chat;
    case 3:
      return AssetPaths.shared.user;
    default:
      return AssetPaths.shared.match;
  }
}
