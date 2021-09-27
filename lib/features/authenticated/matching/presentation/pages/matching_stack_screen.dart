import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/appetizers/global_models/location.dart';
import 'package:matchangoo/core/components/dialogs/show_dialog_methods/show_location_dialog.dart';
import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/authenticated/home/presentation/widgets/tabbar/home_tabbar.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/bloc/matching_bloc.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/widgets/users_stacked.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';

class MatchingScreen extends StatefulWidget {
  const MatchingScreen({Key? key}) : super(key: key);

  @override
  State<MatchingScreen> createState() => _MatchingScreenState();
}

class _MatchingScreenState extends State<MatchingScreen> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      context.read<MatchingBloc>().checkIfWeGotTheLocation(context);
    });

    super.initState();
  }

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
