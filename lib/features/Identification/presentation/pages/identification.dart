import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../authentication/register/presentation/widgets/white_containerwpinkshadow.dart';
import 'package:provider/provider.dart';
import '../widgets/grey_line.dart';
import '../widgets/progress_widget.dart';

import '../../../../core/structure/utils/extensions/context_extension.dart';

import '../cubit/identification_cubit.dart';
import '../ui_configs.dart';

class Identification extends StatefulWidget {
  Identification({Key? key}) : super(key: key);

  @override
  _IdentificationState createState() => _IdentificationState();
}

class _IdentificationState extends State<Identification> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void didChangeDependencies() {
    _animationController = AnimationController(lowerBound: 0, upperBound: context.heightUnit * 3, vsync: this, duration: Duration(milliseconds: 531));
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<AnimationController>(
      create: (context) => _animationController,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return WhiteContainerWPinkShadow(
            extraMarginTop: _animationController.value * 50 / 6,
            child: Column(
              children: [
                animatedRowTop(context, animatedValue: _animationController.value),
                identificationPageView(context, animatedValue: _animationController.value),
              ],
            ),
          );
        },
      ),
    );
  }

  BlocBuilder animatedRowTop(BuildContext context, {required double animatedValue}) {
    return BlocBuilder<IdentificationCubit, int>(
      builder: (context, state) {
        return Container(
          height: context.heightUnit * 3 - animatedValue,
          margin: EdgeInsets.all(context.heightUnit * 2),
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
              statusIcon(5, state)
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

  @override
  void dispose() {
    _animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}

Container identificationPageView(BuildContext context, {required double animatedValue}) {
  return Container(
    height: (context.dynamicHeight / 2) - (animatedValue * 100 / 3 / 2),
    child: PageView(
      physics: NeverScrollableScrollPhysics(),
      reverse: false,
      controller: context.read<IdentificationCubit>().pageController,
      onPageChanged: (int page) {
        //   context.read<IdentificationCubit>().onPageChanged(page);
      },
      children: context.read<IdentificationCubit>().identificationRepo.identificationPages(),
    ),
  );
}
