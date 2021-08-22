import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/utils/adaptive_dialoger.dart';
import 'package:matchangoo/core/constants/app_constants.dart';
import 'package:matchangoo/core/init/get_them_all/get_it_container.dart';

import 'package:matchangoo/features/Identification/presentation/cubit/identification_cubit.dart';
import 'package:matchangoo/features/Identification/presentation/ui_configs.dart';

class Identification extends StatefulWidget {
  Identification({Key? key}) : super(key: key);

  @override
  _IdentificationState createState() => _IdentificationState();
}

class _IdentificationState extends State<Identification> {
  final PageController _pageController = PageController(initialPage: 0);

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
      child: BlocProvider(
          create: (context) => IdentificationCubit(),
          child: Builder(
              builder: (context) => Scaffold(
                      body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      animatedRowTop(context),
                      identificationPageView(context),
                    ],
                  )))),
    );
  }

  Expanded identificationPageView(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        reverse: false,
        controller: context.read<IdentificationCubit>().pageController,
        onPageChanged: (int page) {
          context.read<IdentificationCubit>().onPageChanged(page);
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
            Row(
              children: [upperAnimatedContainer(context), greyContainer()],
            ),
            backButton(context, context.read<IdentificationCubit>().pageKeepTrack),
          ],
        );
      },
    );
  }

  Container backButton(BuildContext context, int page) {
    return Container(
        child: page != 0
            ? IconButton(
                onPressed: () {
                  context.read<IdentificationCubit>().getPrevious();
                },
                icon: Icon(Icons.arrow_back_ios))
            : Container());
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
