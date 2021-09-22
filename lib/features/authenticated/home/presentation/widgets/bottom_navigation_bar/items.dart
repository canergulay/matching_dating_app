import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/features/authenticated/home/presentation/bloc/bottom_navbar_cubit.dart';
import 'package:matchangoo/features/authenticated/home/presentation/widgets/bottom_navigation_bar/bottom_navigation_item.dart';

class BottomBarItems extends StatelessWidget {
  const BottomBarItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: bottomNavigationBarItem(state, context, myIndex: 0)),
            Expanded(child: bottomNavigationBarItem(state, context, myIndex: 1)),
            Expanded(child: bottomNavigationBarItem(state, context, myIndex: 2)),
            Expanded(child: bottomNavigationBarItem(state, context, myIndex: 3)),
          ],
        );
      },
    );
  }
}
