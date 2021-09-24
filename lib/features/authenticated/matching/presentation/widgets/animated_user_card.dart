import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/features/authenticated/matching/configuration/swipe_direction_enum.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/bloc/matching_bloc.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/widgets/user_card.dart';

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
  double swipeLogger = 0;
  double _dY = 0;
  bool _isLeft = false;

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
    _animationController.animateBack(0, curve: Curves.bounceOut, duration: const Duration(seconds: 1));
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
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, anim) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              secondUser(),
              Positioned(
                top: _dY - (_isLeft ? -_animationController.value : _animationController.value),
                left: _animationController.value,
                child: Transform.rotate(
                  angle: _animationController.value / 1500,
                  child: Draggable(
                    onDraggableCanceled: (V, o) {
                      print('cancel yedik');
                    },
                    onDragUpdate: _onDragUpdate,
                    onDragEnd: _onDragEnd,
                    childWhenDragging: const SizedBox(),
                    feedback: Transform.rotate(
                      angle: _animationController.value,
                      child: userCardChild(),
                    ),
                    child: userCardChild(),
                  ),
                ),
              ),
            ],
          );
        });
  }

  void _onDragEnd(details) {
    _animationController.value = details.offset.dx;
    if (details.offset.dx < 0) {
      if (details.offset.dx < -_dragLimit) {
        _goToLeft(details.offset.dy);
      } else {
        _goToZero();
      }
    } else {
      if (details.offset.dx > _dragLimit) {
        _goToRight(details.offset.dy);
      } else {
        _goToZero();
      }
    }
  }

  void _onDragUpdate(DragUpdateDetails details) {
    print(details.primaryDelta);
    _helperAnimationController.forward();
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
              isFirstCard: widget.isFirstCard,
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
      isFirstCard: widget.isFirstCard,
      goLeft: () => _goToLeft(0),
      goRight: () => _goToRight(0),
      userImage: widget.userImage,
      color: Colors.green,
    );
  }
}
