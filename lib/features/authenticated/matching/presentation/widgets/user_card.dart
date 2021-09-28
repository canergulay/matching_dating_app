import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/buttons/animator_button.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';
import 'package:matchangoo/features/authenticated/matching/data/models/user.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/bloc/animation_helper_cubit.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/widgets/buttons/chat_button.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/widgets/user_photo.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'buttons/dislike_button.dart';
import 'buttons/like_button.dart';

class UserCard extends StatelessWidget {
  static const double _borderRadius = 16;
  final Color color;
  final bool isFirstCard;
  final double position;
  final double value;
  final VoidCallback goLeft;
  final VoidCallback goRight;
  final User user;

  const UserCard(
      {Key? key,
      required this.color,
      required this.isFirstCard,
      required this.goLeft,
      required this.value,
      required this.goRight,
      required this.user,
      required this.position})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HelperAnimatorCubit, double>(
      builder: (context, state) {
        return Transform.rotate(
          angle: isFirstCard ? state : 0,
          child: Transform.scale(
            scale: isFirstCard ? 1 - state.abs() * 0.25 : 1,
            child: Stack(
              children: [
                userCardMain(context, state),
                showFilterIfFirstCard(context, state, value),
              ],
            ),
          ),
        );
      },
    );
  }

  Container filterContainer(BuildContext context, double state, double value) {
    return Container(
      decoration: BoxDecoration(color: colorGetter(state * 1.5), borderRadius: BorderRadius.circular(UserCard._borderRadius)),
      height: state.abs() > 0 ? context.dynamicHeight * 0.70 : 0,
      width: context.dynamicWidth * 0.90,
    );
  }

  Color colorGetter(double state) {
    if (state > 0) {
      return Palette.successGreen.withOpacity(state);
    } else {
      return Palette.errorRed.withOpacity(state.abs() * 0.70);
    }
  }

  Widget showFilterIfFirstCard(BuildContext context, double state, double value) => isFirstCard ? filterContainer(context, state, value) : SizedBox();

  Container userCardMain(BuildContext context, double state) {
    return Container(
      height: context.dynamicHeight * 0.70,
      width: context.dynamicWidth * 0.90,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(UserCard._borderRadius), color: Colors.white, boxShadow: [
        BoxShadow(
          color: isFirstCard ? Colors.black12.withOpacity(0.1) : Colors.black12.withOpacity(state.abs() < 0.1 ? state.abs() : 0.1),
          blurRadius: 10.0,
          spreadRadius: 4,
          offset: const Offset(
            0.0,
            5.0,
          ),
        ),
      ]),
      margin: EdgeInsets.all(position),
      child: Column(
        children: [userPhoto(), buttons(), const Spacer()],
      ),
    );
  }

  Expanded buttons() {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DislikeButton(
            goLeft: goLeft,
          ),
          LikeButton(
            goRight: goRight,
          ),
          const ChatButton(),
        ],
      ),
    );
  }

  Expanded userPhoto() {
    return Expanded(
      flex: 22,
      child: UserPhoto(
        userImage: user.pictures?[0],
        containerRadius: UserCard._borderRadius,
      ),
    );
  }
}
