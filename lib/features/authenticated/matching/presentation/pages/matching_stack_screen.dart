import 'package:flutter/material.dart';
import 'package:matchangoo/features/authenticated/home/presentation/widgets/tabbar/home_tabbar.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/widgets/users_stacked.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';

class MatchingScreen extends StatelessWidget {
  const MatchingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(context.limitedwidthUnit * 1, 0, context.limitedwidthUnit * 1, 0),
      child: Column(
        children: [
          const SizedBox().heightSpacer(context, 1),
          homeTabBar(context),
          Expanded(child: UsersStacked()),
          const SizedBox().heightSpacer(context, 5)
        ],
      ),
    );
  }
}
