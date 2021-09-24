import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/utils/animation_helper_cubit.dart';
import 'package:matchangoo/features/authenticated/matching/configuration/swipe_direction_enum.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/bloc/animation_helper_cubit.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/bloc/matching_bloc.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/widgets/user_card.dart';
import 'package:provider/provider.dart';

class AnimatedUserCard extends StatefulWidget {
  final String userImage;
  final bool isFirstCard;
  const AnimatedUserCard({Key? key, required this.isFirstCard, required this.userImage}) : super(key: key);

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

    _helperAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 345), lowerBound: 0.75, upperBound: 0.95);

    super.initState();
  }

  void _goToZero() {
    _dY = 0;
    _animationController.animateBack(0, curve: Curves.bounceOut, duration: const Duration(seconds: 3));
  }

  void _goToLeft(double offSet) {
    _dY = offSet;
    _isLeft = true;
    _animationController.animateBack(_animationController.lowerBound, curve: Curves.easeInOutCirc, duration: const Duration(milliseconds: 450));
    context.read<MatchingBloc>().add(MatchingSwiped(swipeDirection: SwipeDirection.left));
  }

  void _goToRight(double offSet) {
    _dY = offSet;
    _animationController.animateBack(_animationController.upperBound, curve: Curves.easeInOutCirc, duration: const Duration(milliseconds: 450));
    context.read<MatchingBloc>().add(MatchingSwiped(swipeDirection: SwipeDirection.right));
  }

  void _biggerSecondCard() {
    _helperAnimationController.value = _helperAnimationController.value + 0.001;
  }

  void _lowerSecondCard() {
    _helperAnimationController.value = _helperAnimationController.value - 0.001;
  }

  @override
  void didChangeDependencies() {
    _dragLimit = MediaQuery.of(context).size.width / 4;
    _halfOfScreen = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
                    onDraggableCanceled: (V, o) {
                      _onDragEnd(o, context);
                      print('cancel');
                    },
                    onDragUpdate: (details) {
                      _onDragUpdate(details, context);
                    },
                    onDragEnd: (details) {
                      print('sasa');
                    },
                    childWhenDragging: const SizedBox(),
                    feedback: BlocProvider.value(value: context.read<HelperAnimatorCubit>(), child: userCardChild()),
                    child: userCardChild(),
                  ),
                ),
              ],
            );
          }),
    );
  }

  void _onDragEnd(Offset offset, BuildContext contexti) {
    print('felan');
    print('cancel2');

    // print(contexti.read<HelperAnimatorCubit>().state);

    // print(contexti.read<HelperAnimatorCubit>().state);

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
    _helperAnimationController.value = _helperAnimationController.value + details.delta.dx / 500;
  }

  void _onDragCancel(BuildContext contexti) {
    print('cancelyedik');
  }

  @override
  void dispose() {
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
            child: UserCard(
              position: 0,
              value: _animationController.value,
              isFirstCard: false,
              goLeft: () => _goToLeft(0),
              goRight: () => _goToRight(0),
              userImage: widget.userImage,
              color: Colors.green,
            ),
          );
        });
  }

  UserCard userCardChild() {
    return UserCard(
      position: 0,
      value: _animationController.value,
      isFirstCard: true,
      goLeft: () => _goToLeft(0),
      goRight: () => _goToRight(0),
      userImage: widget.userImage,
      color: Colors.green,
    );
  }
}
