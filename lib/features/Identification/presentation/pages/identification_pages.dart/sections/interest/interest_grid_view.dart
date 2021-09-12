import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/buttons/grey_button.dart';
import 'package:matchangoo/core/components/utils/on_off_cubit.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';
import 'package:matchangoo/features/Identification/data/models/interest_type.dart';
import 'package:matchangoo/features/Identification/presentation/cubit/interests_cubit.dart';
import 'package:matchangoo/features/Identification/presentation/widgets/keep_alive.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class InterestGridView extends StatelessWidget {
  final InterestType type;
  const InterestGridView({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeepAlivePage(
      child: BlocProvider<InterestsCubit>(
        create: (context) => context.read<InterestManagerCubit>().getInterestCubit(type)!,
        child: BlocBuilder<InterestsCubit, InterestsState>(
          builder: (context, state) {
            if (state is InterestInitial) {
              return Center(child: CircularProgressIndicator());
            } else {
              InterestLoaded _loadedState = (state as InterestLoaded);
              return Container(
                margin: EdgeInsets.all(12),
                child: Wrap(
                    spacing: 20,
                    runSpacing: 10,
                    children: _loadedState.interestList
                        .map(
                          (list) => mainContainer(context, name: list.names?["en_US"] ?? ""),
                        )
                        .toList()),
              );
            }
          },
        ),
      ),
    );
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

BlocProvider mainContainer(BuildContext context, {required String name}) {
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
          child: Container(
            width: name.length <= 4 ? name.length * 18 : name.length * 12,
            height: 40,
            child: greyContainer(
              padding: 0,
              rightPadding: 0,
              borderWidth: 0.15,
              color: state ? Palette.BUTTONINACTIVE.withOpacity(0.45) : Palette.GENDERBUTTONINACTIVE,
              child: Center(
                  child: Text(name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w500, color: state ? Colors.black : Colors.grey.shade500))),
            ),
          ),
        );
      },
    ),
  );
}
