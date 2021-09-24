import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/features/authenticated/home/presentation/bloc/bottom_navbar_cubit.dart';
import 'package:matchangoo/features/authenticated/home/presentation/widgets/appBar/custom_app_bar.dart';
import 'package:matchangoo/features/authenticated/home/presentation/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/features/authenticated/home/presentation/widgets/home_screens.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/bloc/matching_bloc.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/pages/matching_stack_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavBarCubit()),
        BlocProvider(create: (context) => MatchingBloc()),
      ],
      child: Scaffold(
          appBar: CustomAppBar(
            contextHeight: context.limitedheightUnit,
          ),
          bottomNavigationBar: const CustomBottomNavigationBar(),
          body: BlocBuilder<BottomNavBarCubit, int>(
            builder: (context, state) {
              return screens[state];
            },
          )),
    );
  }
}
