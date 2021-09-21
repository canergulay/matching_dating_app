import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';

import 'package:flutter/material.dart';
import 'package:matchangoo/core/structure/utils/widgets/logo.dart';
import 'package:matchangoo/features/home/presentation/widgets/appBar/drawer_button.dart';
import 'package:matchangoo/features/home/presentation/widgets/appBar/notification_button.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';

class CustomAppBar extends PreferredSize {
  final double contextHeight;
  CustomAppBar({required this.contextHeight}) : super(child: const AppBarBody(), preferredSize: Size.fromHeight(contextHeight * 14));
}

class AppBarBody extends StatelessWidget {
  const AppBarBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: context.limitedheightUnit * 5,
          bottom: context.limitedheightUnit * 2,
          left: context.limitedwidthUnit * 3.31,
          right: context.limitedwidthUnit * 3.31),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const DrawerButton(),
          Row(
            children: [
              logo(),
              const SizedBox().widthSpacer(context, 1),
              matchify(context),
            ],
          ),
          const NotificationButton()
        ],
      ),
    );
  }
}
