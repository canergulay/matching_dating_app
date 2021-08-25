import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          animatedRowTop(context),
          identificationPageView(context),
        ],
      ),
    );
  }

  Expanded identificationPageView(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        reverse: false,
        controller: context.read<IdentificationCubit>().pageController,
        onPageChanged: (int page) {
          //   context.read<IdentificationCubit>().onPageChanged(page);
        },
        itemBuilder: (contexta, index) {
          return context.read<IdentificationCubit>().identificationPages(context)[index];
        },
        itemCount: context.read<IdentificationCubit>().identificationPages(context).length,
      ),
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
