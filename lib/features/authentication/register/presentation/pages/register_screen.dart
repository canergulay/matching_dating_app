import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/utils/get_out_of_here.dart';
import '../../../../../core/structure/utils/widgets/background_widget_wlogo.dart';
import '../../../../../core/structure/utils/widgets/logo.dart';
import '../../../../../core/ui/components/headlines.dart';
import '../../../../Identification/presentation/cubit/identification_cubit.dart';
import '../../../../Identification/presentation/pages/identification_pages.dart/sections/photo_selection.dart';
import '../widgets/white_containerwpinkshadow.dart';
import '../../../../../core/init/get_them_all/get_it_container.dart';
import '../../../../Identification/presentation/pages/identification.dart';
import '../bloc/register_bloc.dart';
import '../widgets/email_verification_code.dart';
import '../widgets/email_verification_error.dart';
import '../widgets/email_verification_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(create: (context) => sl.get<RegisterBloc>()),
        BlocProvider<IdentificationCubit>(create: (context) => context.read<RegisterBloc>().identificationCubit),
      ],
      child: SafeArea(
        child: Scaffold(body: SingleChildScrollView(
          child: BackGroundContainerWithOutLogo(
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                if (state is RegisterInitial) {
                  // return SingleChildScrollView(child: columnSupplierWbBUTTON(state, context, WhiteContainerWPinkShadow(child: Identification())));

                  return columnSupplierWbBUTTON(state, context, const EmailVerifyContainer());
                } else if (state is RegisterWithEmailSent) {
                  return columnSupplierWbBUTTON(state, context, emailCodeVerificationCodeEnter(context));
                } else if (state is RegisterWithEmailVerified) {
                  return SingleChildScrollView(child: columnSupplierWbBUTTON(state, context, Identification()));
                } else if (state is PhotoSelection) {
                  return columnSupplierWbBUTTON(state, context, const PhotoSelectionScreen());
                } else if (state is IdentificationCompleted) {
                  return columnSupplierWbBUTTON(
                      state,
                      context,
                      SingleChildScrollView(
                        child: SizedBox(
                            child: Column(
                          children: [
                            headLineEight(context, context.read<IdentificationCubit>().registrationEntity.name ?? 'no name'),
                            headLineEight(context, context.read<IdentificationCubit>().registrationEntity.email ?? 'no mail'),
                            headLineEight(context, context.read<IdentificationCubit>().registrationEntity.password ?? 'no pass'),
                            headLineEight(context, context.read<IdentificationCubit>().registrationEntity.studycode ?? 'no studycode'),
                            headLineEight(context, context.read<IdentificationCubit>().registrationEntity.fieldOfStudy ?? 'no fos'),
                            headLineEight(context, context.read<IdentificationCubit>().registrationEntity.genderType.toString()),
                            headLineEight(context, context.read<IdentificationCubit>().registrationEntity.birthday ?? 'nobd'),
                            Column(
                              children: context
                                      .read<IdentificationCubit>()
                                      .registrationEntity
                                      .interestedIns
                                      ?.map((e) => headLineEight(context, e.toString()))
                                      .toList() ??
                                  [],
                            ),
                            Column(
                              children: context
                                      .read<IdentificationCubit>()
                                      .registrationEntity
                                      .interests
                                      ?.map((e) => headLineEight(context, e.toString()))
                                      .toList() ??
                                  [],
                            ),
                            headLineEight(context, 'Bitti üyesin artık'),
                            Column(
                              children: context
                                      .read<IdentificationCubit>()
                                      .registrationEntity
                                      .photoURLS
                                      ?.map((e) => headLineEight(context, e.toString()))
                                      .toList() ??
                                  [],
                            ),
                            Column(
                              children: context
                                      .read<IdentificationCubit>()
                                      .registrationEntity
                                      .photos
                                      ?.map((path) => Image.file(File(path ?? '')))
                                      .toList() ??
                                  [],
                            )
                          ],
                        )),
                      ));
                } else {
                  return columnSupplierWbBUTTON(state, context, emailCouldNotBeVerified(context));
                }
              },
            ),
          ),
        )),
      ),
    );
  }
}

Column columnSupplierWbBUTTON(RegisterState state, BuildContext context, Widget child) => Column(
      children: [
        matchifyLogoWithBackButtonWcustomPress(
            context: context,
            onTap: () async {
              if (state is RegisterWithEmailVerified) {
                // IF WE LOGIN WITH A VALID EMAIL / FACEBOOK / GMAIL

                if (context.read<IdentificationCubit>().pageController.page != context.read<IdentificationCubit>().pageController.initialPage) {
                  // IF IT IS NOT THE FIRST PAGE, WE LET THE USER GO BACK IN THE IDENTIFICATION PAGES

                  // WHICH IS NOTHING BUT A SIMPLE PAGEVIEW

                  context.read<IdentificationCubit>().getPrevious();
                } else {
                  showSureThenQuit(context: context, title: 'ARE_YOU_SURE.title'.tr(), message: 'ARE_YOU_SURE.backmessage'.tr());
                }
              } else if (state is RegisterInitial) {
                getOutOfHere(context);
              } else if (state is PhotoSelection) {
                showSureThenQuit(context: context, title: 'ARE_YOU_SURE.title'.tr(), message: 'ARE_YOU_SURE.backmessage'.tr());
              } else {
                // IF WE ARE STILL IN THE MAIL VERIFICATON PROCESS, WE WILL AGAIN KILL THE PROCESS

                showSureThenQuit(context: context, title: 'ARE_YOU_SURE.title'.tr(), message: 'ARE_YOU_SURE.backmessage'.tr());
              }
            }),
        child
      ],
    );
