import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/utils/animation_helper_cubit.dart';
import 'package:matchangoo/core/init/network/network_manager.dart';
import 'package:matchangoo/features/authenticated/matching/configuration/swipe_direction_enum.dart';
import 'package:matchangoo/features/authenticated/matching/data/models/user.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/bloc/animation_helper_cubit.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/bloc/matching_bloc.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/widgets/user_card.dart';
import 'package:provider/provider.dart';

class AnimatedUserCard extends StatefulWidget {
  final User user;
  final User secondUser;
  final bool isFirstCard;
  const AnimatedUserCard({Key? key, required this.isFirstCard, required this.secondUser, required this.user}) : super(key: key);

  @override
  State<AnimatedUserCard> createState() => _AnimatedUserCardState();
}

class _AnimatedUserCardState extends State<AnimatedUserCard> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final AnimationController _helperAnimationController;
  late final double _dragLimit;
  late final double _halfOfScreen;
  double _dY = 0;
  bool _isLeft = false;
  double _rotateValue = 0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: -500,
      value: 0,
      upperBound: 500,
    );
    _helperAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 345), lowerBound: 0.75, upperBound: 1);
    super.initState();
  }

  void _goToZero() {}

  void _goToLeft(double offSet) async {
    _dY = offSet;
    _isLeft = true;
    _helperAnimationController.forward();
    await _animationController.animateBack(_animationController.lowerBound, curve: Curves.easeInOutCirc, duration: const Duration(milliseconds: 450));
    context.read<HelperAnimatorCubit>().zeroize();

    context.read<MatchingBloc>().add(MatchingSwiped(swipeDirection: SwipeDirection.left));
    _animationController.value = 0;
    _dY = 0;
    _isLeft = false;
    _helperAnimationController.value = 0;
  }

  void _goToRight(double offSet) async {
    _dY = offSet;
    _helperAnimationController.forward();
    await _animationController.animateTo(_animationController.upperBound, curve: Curves.easeInOutCirc, duration: const Duration(milliseconds: 450));
    context.read<HelperAnimatorCubit>().zeroize();

    context.read<MatchingBloc>().add(MatchingSwiped(swipeDirection: SwipeDirection.right));
    _animationController.value = 0;
    _dY = 0;
    _isLeft = false;

    _helperAnimationController.value = 0;
  }

  @override
  void didChangeDependencies() {
    _dragLimit = MediaQuery.of(context).size.width / 4;
    _halfOfScreen = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('HERE IS THE BUILD!');
    return BlocProvider<HelperAnimatorCubit>(
      create: (context) => HelperAnimatorCubit(),
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, anim) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                secondUser(),
                Positioned(
                  top: _dY - (_isLeft ? -_animationController.value : _animationController.value),
                  left: _animationController.value,
                  child: Draggable(
                    key: UniqueKey(),
                    onDraggableCanceled: (V, o) {
                      _onDragCanceled(o, context);
                    },
                    onDragUpdate: (details) {
                      _onDragUpdate(details, context);
                    },
                    onDragEnd: (details) {},
                    childWhenDragging: const SizedBox(),
                    feedback: BlocProvider.value(value: context.read<HelperAnimatorCubit>(), child: userCardChild(true, widget.user)),
                    child: userCardChild(true, widget.user),
                  ),
                ),
              ],
            );
          }),
    );
  }

  void _onDragCanceled(Offset offset, BuildContext contexti) {
    if (offset.dx < 0) {
      if (offset.dx < -_dragLimit) {
        _animationController.value = offset.dx;
        _goToLeft(offset.dy);
      } else {
        _goToZero();
        contexti.read<HelperAnimatorCubit>().reverse();
      }
    } else {
      if (offset.dx > _dragLimit) {
        _animationController.value = offset.dx;

        _goToRight(offset.dy);
      } else {
        _goToZero();
        contexti.read<HelperAnimatorCubit>().reverse();
      }
    }
  }

  void _onDragUpdate(DragUpdateDetails details, BuildContext contexti) {
    contexti.read<HelperAnimatorCubit>().update(details.delta.dx / 1000);
    _helperAnimationController.value = _helperAnimationController.value + details.delta.dx / 1000;
  }

  @override
  void dispose() {
    print('dispose yedik');
    _animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Widget secondUser() {
    return AnimatedBuilder(
        animation: _helperAnimationController,
        builder: (context, anim) {
          return Transform.scale(
            scale: _helperAnimationController.value,
            child: userCardChild(false, widget.secondUser),
          );
        });
  }

  UserCard userCardChild(bool isFirstCard, User user) {
    return UserCard(
      position: 0,
      value: _animationController.value,
      isFirstCard: isFirstCard,
      goLeft: () => _goToLeft(0),
      goRight: () => _goToRight(0),
      user: user,
      color: Colors.green,
    );
  }
}
