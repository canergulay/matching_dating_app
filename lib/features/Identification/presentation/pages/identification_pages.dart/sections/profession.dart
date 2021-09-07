import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/buttons/grey_button.dart';
import 'package:matchangoo/core/components/buttons/grey_textfield.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';
import 'package:matchangoo/features/Identification/data/models/profession/degree_types.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification_pages.dart/repo/degree_type_list.dart';
import 'package:matchangoo/features/Identification/presentation/widgets/onboard_container_column.dart';
import '../../../../../../core/components/utils/on_off_cubit.dart';
import '../../../../../../core/structure/utils/extensions/context_extension.dart';
import '../../../cubit/gender_cubit.dart';
import '../../../cubit/identification_cubit.dart';
import '../../../cubit/profession_cubit.dart';
import '../../identification.dart';
import '../utils/onboard_text.dart';

import '../../../../../../core/structure/utils/extensions/sizedBox_extension.dart';
import '../../../widgets/activatable_button.dart';
import '../../../widgets/gender_grey_button.dart';

class Profession extends StatelessWidget {
  const Profession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => context.read<IdentificationCubit>().professionCubit,
        ),
        BlocProvider(create: (context) => context.read<IdentificationCubit>().professionCubit.degreeCubit),
        BlocProvider(
          create: (context) => OnOffCubit(),
        ),
      ],
      child: BlocBuilder<ProfessionCubit, ProfessionType>(
        builder: (contexta, state) {
          return onboardContainerColumn(context: context, children: [
            onBoardText('Profession?', context),
            Text(
              'Your age will be public',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox().heightSpacer(context, 2),
            buttonsRow(contexta, state),
            SizedBox().heightSpacer(context, 2),
            extraChoices(contexta, state),
            SizedBox().heightSpacer(context, 2),
            activatableButton(onPressed: () {
              FocusScope.of(context).unfocus();
              context.read<IdentificationCubit>().goToNextPage();
            })
          ]);
        },
      ),
    );
  }

  Row buttonsRow(BuildContext context, ProfessionType state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: GestureDetector(
                onTap: () {
                  context.read<ProfessionCubit>().changeProfession(ProfessionType.STUDENT);
                  context.read<OnOffCubit>().on();
                },
                child: genderGreyButton(isActive: state == ProfessionType.STUDENT ? true : false, text: 'Student', context: context))),
        SizedBox().widthSpacer(context, 2),
        Expanded(
            child: GestureDetector(
                onTap: () {
                  context.read<ProfessionCubit>().changeProfession(ProfessionType.WORKER);
                  context.read<OnOffCubit>().on();
                },
                child: genderGreyButton(isActive: state == ProfessionType.WORKER ? true : false, text: 'Working', context: context))),
      ],
    );
  }

  Widget extraChoices(BuildContext context, ProfessionType professionType) {
    if (professionType == ProfessionType.NONE) {
      return Container();
    } else if (professionType == ProfessionType.STUDENT) {
      return studentColumn(context);
    } else {
      return workingColumn(context);
    }
  }

  Column workingColumn(BuildContext context) => Column(
        children: [],
      );

  BlocBuilder studentColumn(BuildContext context) {
    return BlocBuilder<DegreeCubit, DegreeType?>(
      builder: (contexta, state) {
        return Column(
          children: [degreeDropdown(context, state: state), nextTextField(context, code: state?.code ?? 'hs')],
        );
      },
    );
  }

  Container degreeDropdown(
    BuildContext context, {
    DegreeType? state,
  }) {
    return greyContainer(
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton<DegreeType>(
              style: Theme.of(context).textTheme.headline6,
              hint: Text(
                'degree'.tr() + '*',
                style: Theme.of(context).textTheme.headline6,
              ),
              value: state,
              onChanged: (DegreeType? type) {
                context.read<DegreeCubit>().onValueChange(type);
                context.read<IdentificationCubit>().registrationEntity.studycode = type?.code;
              },
              items: context.read<DegreeCubit>().degreesRepo.degreeItems(context)),
        ),
      ),
    );
  }

  Widget nextTextField(
    BuildContext context, {
    required String code,
  }) {
    if (code == DegreeCodes.HIGH_SCHOOL) {
      return Container();
    } else {
      return textFieldContainer(
          context: context,
          textAlign: TextAlign.left,
          hintText: 'fostudy'.tr() + '*',
          focusNode: FocusNode(),
          textInputType: TextInputType.text,
          onChanged: (String text) {
            print(text);
          });
    }
  }
}
