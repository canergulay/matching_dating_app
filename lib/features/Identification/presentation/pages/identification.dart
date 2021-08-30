import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/structure/utils/widgets/logo.dart';
import 'package:matchangoo/features/authentication/register/presentation/widgets/white_containerwpinkshadow.dart';
import '../../../../core/components/utils/adaptive_dialoger.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/init/get_them_all/get_it_container.dart';
import '../../../../core/structure/utils/extensions/context_extension.dart';

import '../cubit/identification_cubit.dart';
import '../ui_configs.dart';

class Identification extends StatefulWidget {
  Identification({Key? key}) : super(key: key);

  @override
  _IdentificationState createState() => _IdentificationState();
}

class _IdentificationState extends State<Identification> {
  @override
  void initState() {
    AdaptiveDialoger dialogcu = sl.get<AdaptiveDialoger>();
    SchedulerBinding.instance!
        .addPostFrameCallback((_) => dialogcu.showBasicAdaptiveAlert(context, AppConstants.DIALOGTITLE, AppConstants.DIALOGMESSAGE));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        animatedRowTop(context),
        Expanded(child: identificationPageView(context)),
      ],
    );
  }

  BlocBuilder animatedRowTop(BuildContext context) {
    return BlocBuilder<IdentificationCubit, int>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backButton(context, context.read<IdentificationCubit>().state),
            Container(
              padding: EdgeInsets.only(left: context.widthUnit * 3, right: context.widthUnit * 3),
              child: Row(
                children: [upperAnimatedContainer(context), greyContainer()],
              ),
            ),
          ],
        );
      },
    );
  }

  Container backButton(BuildContext context, int page) {
    return page != 0
        ? Container(
            child: IconButton(
                onPressed: () {
                  context.read<IdentificationCubit>().getPrevious();
                },
                icon: Icon(Icons.arrow_back_ios)),
          )
        : Container(
            padding: EdgeInsets.only(left: context.widthUnit * 1.5),
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'cancel registration',
                  style: Theme.of(context).textTheme.headline6,
                )),
          );
  }

  Expanded greyContainer() {
    return Expanded(
      child: Container(
        height: UiConfigs.containerHeight,
        color: UiConfigs.containerGrey,
      ),
    );
  }

  AnimatedContainer upperAnimatedContainer(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        alignment: Alignment.centerLeft,
        height: UiConfigs.containerHeight,
        width: context.read<IdentificationCubit>().containerWidth(context),
        color: UiConfigs.containerColor);
  }
}

PageView identificationPageView(BuildContext context) {
  return PageView.builder(
    physics: NeverScrollableScrollPhysics(),
    reverse: false,
    controller: context.read<IdentificationCubit>().pageController,
    onPageChanged: (int page) {
      //   context.read<IdentificationCubit>().onPageChanged(page);
    },
    itemBuilder: (contexta, index) {
      return context.read<IdentificationCubit>().identificationRepo.identificationPages()[index];
    },
    itemCount: context.read<IdentificationCubit>().identificationRepo.identificationPages().length,
  );
}
