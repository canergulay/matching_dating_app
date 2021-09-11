import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/utils/on_off_cubit.dart';
import 'package:matchangoo/core/init/get_them_all/get_it_container.dart';
import 'package:matchangoo/features/Identification/presentation/cubit/interests_cubit.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification_pages.dart/sections/interest/interest_tabbar_view.dart';
import 'package:matchangoo/features/Identification/presentation/widgets/activatable_button.dart';
import 'package:matchangoo/features/Identification/presentation/widgets/onboard_container_column.dart';
import 'package:matchangoo/features/authentication/register/presentation/bloc/register_bloc.dart';
import '../../../../../../../core/components/buttons/grey_button.dart';
import '../../../../../../../core/structure/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import '../../../../../../../core/ui/theme/palette.dart';
import '../../../../cubit/identification_cubit.dart';

import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

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
            onPressed: () {
              context.read<RegisterBloc>().add(IdentificationAlmostFinished());
            },
            shouldBeActive: true),
      ]),
    );
  }
}
