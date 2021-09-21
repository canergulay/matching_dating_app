import 'package:flutter/material.dart';
import 'package:matchangoo/features/matching/presentation/widgets/user_card.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';
import 'package:matchangoo/features/matching/presentation/widgets/users_stacked.dart';

class MatchingScreen extends StatelessWidget {
  const MatchingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(context.limitedwidthUnit * 3, 0, context.limitedwidthUnit * 3, context.limitedwidthUnit * 3),
      child: Column(
        children: [const Icon(Icons.ac_unit), const Expanded(child: UsersStacked()), const SizedBox().heightSpacer(context, 1)],
      ),
    );
  }
}