import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/features/Identification/presentation/cubit/identification_cubit.dart';
import '../../../../../../../core/components/buttons/grey_button.dart';
import '../../../../../../../core/components/utils/localisation_string_returner.dart';
import '../../../../../../../core/components/utils/on_off_cubit.dart';
import '../../../../../../../core/init/app_cubit/app_cubit.dart';
import '../../../../../../../core/ui/theme/palette.dart';
import '../../../../../data/models/interest_type.dart';
import '../../../../cubit/interests_cubit.dart';
import '../../../../widgets/keep_alive.dart';

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
              return Scrollbar(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                  child: Container(
                    margin: EdgeInsets.all(12),
                    child: Wrap(
                        spacing: 20,
                        runSpacing: 10,
                        children: _loadedState.interestList
                            .map(
                              (list) => mainContainer(context,
                                  interestId: list.id ?? 'nullid',
                                  name: list.names?[LocalisationController.instance.getLanguage(context.read<AppCubit>().state.currentLanguage)] ??
                                      "en_US"),
                            )
                            .toList()),
                  ),
                ),
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

BlocProvider mainContainer(BuildContext context, {required String name, required String interestId}) {
  return BlocProvider<OnOffCubit>(
    create: (contexta) => OnOffCubit(),
    child: BlocBuilder<OnOffCubit, bool>(
      builder: (contexta, state) {
        return GestureDetector(
          onTap: () {
            if (!state) {
              contexta.read<OnOffCubit>().on();
              context.read<IdentificationCubit>().registrationEntity.addInterestIfDoesNotExist(interestId);
              //THIS IS THE CUBIT OF THIS PAGE.
              // BE CAREFUL, THEY ARE DIFFERENT.
            } else {
              contexta.read<OnOffCubit>().off();
              print('deleted');
              context.read<IdentificationCubit>().registrationEntity.deleteInterest(interestId);
            }

            if (context.read<IdentificationCubit>().registrationEntity.getIfInterestsAreNotEmpty) {
              print('bast??k');
              // IN ORDER TO PASS THIS PAGE, WE SHOULD HAVE AT LEAST ONE INTEREST.
              context.read<OnOffCubit>().on();
              //THIS IS THE CUBIT OFF ACTIVATABLE BUTTON
            } else {
              print('bast??k2');
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
