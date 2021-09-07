import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/utils/on_off_cubit.dart';
import 'package:matchangoo/features/Identification/presentation/widgets/activatable_button.dart';
import 'package:matchangoo/features/Identification/presentation/widgets/onboard_container_column.dart';
import 'package:matchangoo/features/authentication/register/presentation/bloc/register_bloc.dart';
import '../../../../../../core/components/buttons/grey_button.dart';
import '../../../../../../core/structure/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/ui/theme/palette.dart';
import '../../../cubit/identification_cubit.dart';
import '../utils/onboard_text.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import '../../../../../../core/structure/utils/extensions/sizedBox_extension.dart';

class SportsHobbiesInterests extends StatelessWidget {
  const SportsHobbiesInterests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnOffCubit(),
      child: onboardContainerColumn(context: context, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            onBoardText('Sports', context),
            greyContainer(
                radius: 10,
                padding: context.heightUnit * 1,
                rightPadding: context.heightUnit * 1,
                color: Palette.TEXTFIELDGREY,
                child: Icon(Icons.search))
          ],
        ),
        SizedBox().heightSpacer(context, 1),
        itemGrid(context, TYPES.SPORTS),
        SizedBox().heightSpacer(context, 1),
        onBoardText('Hobbies', context),
        SizedBox().heightSpacer(context, 1),
        itemGrid(context, TYPES.HOBBIES),
        SizedBox().heightSpacer(context, 1),
        onBoardText('Interest Areas', context),
        SizedBox().heightSpacer(context, 1),
        itemGrid(context, TYPES.INTERESTS),
        activatableButton(
            onPressed: () {
              context.read<RegisterBloc>().add(IdentificationAlmostFinished());
            },
            shouldBeActive: true),
      ]),
    );
  }

  Expanded itemGrid(BuildContext context, TYPES type) {
    return Expanded(
        child: StaggeredGridView.countBuilder(
            physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            mainAxisSpacing: context.widthUnit * 2,
            crossAxisSpacing: context.heightUnit * 2,
            crossAxisCount: 2,
            staggeredTileBuilder: (index) {
              return StaggeredTile.count(1, tileGetter(name(type, context, index)));
            },
            scrollDirection: Axis.horizontal,
            itemCount: itemCount(type, context),
            itemBuilder: (context, index) {
              return mainContainer(type, context, index);
            }));
  }

  BlocProvider mainContainer(TYPES type, BuildContext context, int index) {
    return BlocProvider<OnOffCubit>(
      create: (context) => OnOffCubit(),
      child: BlocBuilder<OnOffCubit, bool>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              if (!state) {
                context.read<OnOffCubit>().on();
              } else {
                context.read<OnOffCubit>().off();
              }
            },
            child: greyContainer(
              padding: 0,
              rightPadding: 0,
              color: state ? Palette.BUTTONINACTIVE.withOpacity(0.45) : Palette.GENDERBUTTONINACTIVE,
              child: Center(
                  child: Text(name(type, context, index),
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.bold, color: state ? Colors.black : Colors.grey.shade500))),
            ),
          );
        },
      ),
    );
  }
}

enum TYPES { SPORTS, HOBBIES, INTERESTS }

int itemCount(TYPES type, BuildContext context) {
  switch (type) {
    case TYPES.SPORTS:
      return context.read<IdentificationCubit>().interests.sports.length;

    case TYPES.HOBBIES:
      return context.read<IdentificationCubit>().interests.hobbies.length;

    case TYPES.INTERESTS:
      return context.read<IdentificationCubit>().interests.interests.length;

    default:
      return context.read<IdentificationCubit>().interests.interests.length;
  }
}

String name(TYPES type, BuildContext context, int index) {
  switch (type) {
    case TYPES.SPORTS:
      return index == 1 ? 's' : context.read<IdentificationCubit>().interests.sports[index].name;

    case TYPES.HOBBIES:
      return context.read<IdentificationCubit>().interests.hobbies[index].name;

    case TYPES.INTERESTS:
      return context.read<IdentificationCubit>().interests.interests[index].name;

    default:
      return context.read<IdentificationCubit>().interests.interests[index].name;
  }
}

double tileGetter(String name) {
  if (name.length > 8) {
    return 2;
  } else if (name.length > 6) {
    return 1.8;
  } else if (name.length > 4) {
    return 1.6;
  } else {
    return 1;
  }
}
