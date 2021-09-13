import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/utils/on_off_cubit.dart';
import 'package:matchangoo/core/init/get_them_all/get_it_container.dart';
import 'package:matchangoo/features/Identification/presentation/cubit/interests_cubit.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification_pages.dart/sections/interest/interest_tabbar_view.dart';
import 'package:matchangoo/features/Identification/presentation/widgets/activatable_button.dart';
import 'package:matchangoo/features/authentication/register/presentation/bloc/register_bloc.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SportsHobbiesInterests extends StatelessWidget {
  const SportsHobbiesInterests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnOffCubit(),
      child: Column(children: [
        Expanded(
            child: BlocProvider(
          create: (context) => sl.get<InterestManagerCubit>(),
          child: InterestTabbarView(),
        )),
        activatableButton(
            onPressed: () async {
              await context.read<AnimationController>().forward();

              context.read<RegisterBloc>().add(IdentificationAlmostFinished());
            },
            shouldBeActive: true),
      ]),
    );
  }
}
