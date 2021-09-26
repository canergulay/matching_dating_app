import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/buttons/animator_button_with_buton_container.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';
import 'package:matchangoo/core/ui/components/ui_constants.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';
import 'package:matchangoo/features/authenticated/home/presentation/bloc/tabbar_cubit.dart';

Container homeTabBar(BuildContext context) {
  return Container(
    margin: EdgeInsets.fromLTRB(
      context.limitedwidthUnit * 2.5,
      context.limitedheightUnit * 5,
      context.limitedwidthUnit * 2.5,
      context.limitedwidthUnit * 2.5,
    ),
    child: Row(
      children: [
        Expanded(
            child: Container(
          child: tabbarItems(context),
          decoration: BoxDecoration(color: Palette.homePageTabGrey, borderRadius: BorderRadius.circular(UiConstants.shared.lowRadius)),
        )),
        SizedBox().widthSpacer(context, 4),
        AnimatorButtonWithContainer(
            containerColor: Palette.homePageTabBlue,
            childToBeAnimated: Image.asset(
              AssetPaths.shared.filter,
              scale: 2.131,
            ),
            onPressed: () {})
      ],
    ),
  );
}

BlocBuilder tabbarItems(BuildContext context) {
  return BlocBuilder<TabbarCubit, int>(
    builder: (context, state) {
      return Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Expanded(child: tabbarItem(context, 0, state)),
            Expanded(child: tabbarItem(context, 1, state)),
            Expanded(child: tabbarItem(context, 2, state)),
          ],
        ),
      );
    },
  );
}

Container tabbarItem(BuildContext context, int index, int state) => Container(
      decoration:
          BoxDecoration(boxShadow: [BoxShadow(color: shadowGetter(index, state), offset: const Offset(0, 5), blurRadius: 11, spreadRadius: 2)]),
      child: AnimatorButtonWithContainer(
        onPressed: () {
          context.read<TabbarCubit>().changePage(index);
        },
        isOnPressedBeforeAnimation: true,
        containerColor: colorGetter(index, state),
        padding: 9,
        childToBeAnimated: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageGetter(index),
              scale: 2,
              color: imageColorGetter(index, state),
            ),
            Text(
              getText(index).tr(),
              style: TextStyle(color: imageColorGetter(index, state)),
            ),
          ],
        ),
      ),
    );

Color colorGetter(int index, int state) {
  if (index == state) {
    return Colors.black;
  } else {
    return Colors.transparent;
  }
}

Color shadowGetter(int index, int state) {
  if (index == state) {
    return Colors.black.withOpacity(0.25);
  } else {
    return Colors.transparent;
  }
}

String imageGetter(int index) {
  switch (index) {
    case 0:
      return AssetPaths.shared.location3;
    case 1:
      return AssetPaths.shared.location2;
    case 2:
      return AssetPaths.shared.globally;
    default:
      return AssetPaths.shared.location3;
  }
}

String getText(int index) {
  switch (index) {
    case 0:
      return "HOMEPAGE.NEARBY";
    case 1:
      return "HOMEPAGE.YOURCOUNTRY";
    case 2:
      return "HOMEPAGE.GLOBAL";
    default:
      return "HOMEPAGE.GLOBAL";
  }
}

Color imageColorGetter(int index, int state) {
  if (index == state) {
    return Colors.white;
  } else {
    return Colors.black;
  }
}
