import 'package:flutter/material.dart';
import 'package:matchangoo/features/home/presentation/widgets/appBar/custom_app_bar.dart';
import 'package:matchangoo/features/home/presentation/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:matchangoo/features/matching/presentation/pages/matching_stack_screen.dart';
import '../../../../core/init/app_cubit/app_cubit.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import '../../../../core/init/get_them_all/get_it_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          contextHeight: context.limitedheightUnit,
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: const MatchingScreen());
  }
}
