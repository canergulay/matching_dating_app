import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/utils/adaptive_dialoger.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/init/get_them_all/get_it_container.dart';
import '../../../../core/structure/utils/extensions/context_extension.dart';
import '../cubit/identification_cubit.dart';
import '../ui_configs.dart';
import '../widgets/ara_line.dart';
import '../widgets/status_icon.dart';

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
        return Container(
          height: context.heightUnit * 3,
          padding: EdgeInsets.only(left: context.widthUnit * 1.5, right: context.widthUnit * 1.5),
          child: Row(
            children: [
              statusIcon(0, state),
              Expanded(
                  child: araLine(
                myIndex: 0,
                stateIndex: state,
              )),
              statusIcon(1, state),
              Expanded(
                  child: araLine(
                myIndex: 1,
                stateIndex: state,
              )),
              statusIcon(2, state),
              Expanded(
                  child: araLine(
                myIndex: 2,
                stateIndex: state,
              )),
              statusIcon(3, state),
              Expanded(
                  child: araLine(
                myIndex: 3,
                stateIndex: state,
              )),
              statusIcon(4, state),
              Expanded(
                  child: araLine(
                myIndex: 4,
                stateIndex: state,
              )),
              statusIcon(4, state)
            ],
          ),
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
