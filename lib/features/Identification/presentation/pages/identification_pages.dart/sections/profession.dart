import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/appetizers/textfield_rules/field_of_study_pass_rule.dart';
import 'package:matchangoo/core/components/buttons/textfield_with_error_scenario.dart';
import '../../../../../../core/components/buttons/grey_button.dart';
import '../../../../../../core/components/buttons/grey_textfield.dart';
import '../../../../data/models/profession/degree_types.dart';
import '../../../widgets/onboard_container_column.dart';
import '../../../../../../core/components/utils/on_off_cubit.dart';

import '../../../cubit/identification_cubit.dart';
import '../../../cubit/profession_cubit.dart';
import '../utils/onboard_text.dart';

import '../../../../../../core/structure/utils/extensions/sizedBox_extension.dart';
import '../../../widgets/activatable_button.dart';
import '../../../widgets/gender_grey_button.dart';

class Profession extends StatefulWidget {
  const Profession({Key? key}) : super(key: key);

  @override
  State<Profession> createState() => _ProfessionState();
}

class _ProfessionState extends State<Profession> {
  late final TextEditingController _fosController;
  late final TextEditingController _jobController;

  @override
  void initState() {
    _fosController = TextEditingController();
    _jobController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

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
            onBoardText('PROFESSION.PROFESSION'.tr(), context),
            Text(
              'PROFESSION.EXPLANATION'.tr(),
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
                },
                child:
                    genderGreyButton(isActive: state == ProfessionType.STUDENT ? true : false, text: 'PROFESSION.STUDENT'.tr(), context: context))),
        SizedBox().widthSpacer(context, 2),
        Expanded(
            child: GestureDetector(
                onTap: () {
                  context.read<ProfessionCubit>().changeProfession(ProfessionType.WORKER);
                  context.read<IdentificationCubit>().registrationEntity.setStudyCode = 'working';
                },
                child: genderGreyButton(isActive: state == ProfessionType.WORKER ? true : false, text: 'PROFESSION.WORKING'.tr(), context: context))),
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

  BlocBuilder studentColumn(BuildContext context) {
    return BlocBuilder<DegreeCubit, DegreeType?>(
      builder: (contexta, state) {
        return Column(
          children: [degreeDropdown(context, state: state), nextTextField(context, code: state?.code ?? 'hs')],
        );
      },
    );
  }

  Column workingColumn(BuildContext context) => Column(
        children: [
          TextFieldContainerWController(
              errorRule: jobPASS,
              controller: _jobController,
              textAlign: TextAlign.left,
              hintText: 'occupation'.tr() + '*',
              textInputType: TextInputType.text,
              onChanged: (String text) {
                if (jobPASS(text)) {
                  context.read<OnOffCubit>().on();
                  context.read<IdentificationCubit>().registrationEntity.setFieldOfStudy = text;
                } else {
                  context.read<OnOffCubit>().off();
                }
              })
        ],
      );

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
      return TextFieldContainerWController(
          errorRule: fosPASS,
          controller: _fosController,
          textAlign: TextAlign.left,
          hintText: 'fostudy'.tr() + '*',
          textInputType: TextInputType.text,
          onChanged: (String text) {
            if (fosPASS(text)) {
              context.read<OnOffCubit>().on();
              context.read<IdentificationCubit>().registrationEntity.setFieldOfStudy = text;
            } else {
              context.read<OnOffCubit>().off();
            }
          });
    }
  }

  @override
  void dispose() {
    _fosController.dispose();
    _jobController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
