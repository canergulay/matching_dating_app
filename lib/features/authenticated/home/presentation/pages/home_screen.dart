import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/buttons/animator_button_with_buton_container.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';
import 'package:matchangoo/core/init/get_them_all/get_it_container.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';
import 'package:matchangoo/features/authenticated/home/presentation/bloc/bottom_navbar_cubit.dart';
import 'package:matchangoo/features/authenticated/home/presentation/bloc/tabbar_cubit.dart';
import 'package:matchangoo/features/authenticated/home/presentation/widgets/appBar/custom_app_bar.dart';
import 'package:matchangoo/features/authenticated/home/presentation/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/features/authenticated/home/presentation/widgets/home_screens.dart';
import 'package:matchangoo/features/authenticated/home/presentation/widgets/tabbar/home_tabbar.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/bloc/matching_bloc.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/pages/matching_stack_screen.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavBarCubit()),
        BlocProvider(create: (context) => TabbarCubit()),
        BlocProvider(create: (context) => sl.get<MatchingBloc>())
      ],
      child: Scaffold(
          bottomNavigationBar: const CustomBottomNavigationBar(),
          body: BlocBuilder<BottomNavBarCubit, int>(
            builder: (context, state) {
              return screens[state];
            },
          )),
    );
  }
}
