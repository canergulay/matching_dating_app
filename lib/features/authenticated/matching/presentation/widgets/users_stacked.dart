import 'package:flutter/material.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/widgets/dummy_user_list.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/widgets/user_card.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class UsersStacked extends StatelessWidget {
  const UsersStacked({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        // THESE ARE ALL DUMMY , JUST TRYING TO CONFIGURE THE UI
        /* children: [
        Transform(
        
          child: UserCard(
            position: 16,
            goLeft: () {},
            goRight: () {},
            userImage: 'https://i.pinimg.com/originals/87/07/90/87079055b55e4dab8117f6d580ec92d5.jpg',
            color: Colors.yellow,
          ),
        ),
        
      ],*/
        children: [for (var i = 0; i < dummyUserList.length; i++) AnimatedUserCard(userImage: dummyUserList[i])]);
  }
}

class AnimatedUserCard extends StatefulWidget {
  final String userImage;
  const AnimatedUserCard({Key? key, required this.userImage}) : super(key: key);

  @override
  State<AnimatedUserCard> createState() => _AnimatedUserCardState();
}

class _AnimatedUserCardState extends State<AnimatedUserCard> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final double _dragLimit;
  double _dY = 0;
  bool isLeft = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: -500,
      value: 0,
      upperBound: 500,
    );

    super.initState();
  }

  void _goToZero() {
    _dY = 0;
    _animationController.animateBack(0, curve: Curves.bounceOut, duration: const Duration(seconds: 1));
  }

  void _goToLeft(double offSet) {
    _dY = offSet;
    isLeft = true;
    _animationController.animateBack(_animationController.lowerBound, curve: Curves.easeInOutCirc, duration: const Duration(milliseconds: 450));
  }

  void _goToRight(double offSet) {
    _dY = offSet;
    _animationController.animateBack(_animationController.upperBound, curve: Curves.easeInOutCirc, duration: const Duration(milliseconds: 450));
  }

  @override
  void didChangeDependencies() {
    _dragLimit = MediaQuery.of(context).size.width / 4;
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
              Positioned(
                top: _dY - (isLeft ? -_animationController.value : _animationController.value),
                left: _animationController.value,
                child: Transform.rotate(
                  angle: _animationController.value / 1500,
                  child: Draggable(
                    onDragUpdate: (details) {},
                    onDragEnd: (details) {
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
                    },
                    childWhenDragging: const SizedBox(),
                    feedback: Transform.rotate(
                      angle: _animationController.value / 10000,
                      child: UserCard(
                        position: 0,
                        goLeft: () => _goToLeft(0),
                        goRight: () => _goToRight(0),
                        userImage: widget.userImage,
                        color: Colors.green,
                      ),
                    ),
                    child: UserCard(
                      position: 0,
                      goLeft: () => _goToLeft(0),
                      goRight: () => _goToRight(0),
                      userImage: widget.userImage,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    _animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
