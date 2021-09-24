import 'package:flutter/material.dart';
import 'package:matchangoo/core/components/buttons/animator_button.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/widgets/buttons/chat_button.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/widgets/user_photo.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'buttons/dislike_button.dart';
import 'buttons/like_button.dart';

class UserCard extends StatefulWidget {
  static const double _borderRadius = 16;
  final Color color;
  final bool isFirstCard;
  final String userImage;
  final double position;
  final double value;
  final VoidCallback goLeft;
  final VoidCallback goRight;
  const UserCard(
      {Key? key,
      required this.color,
      required this.isFirstCard,
      required this.goLeft,
      required this.value,
      required this.goRight,
      required this.userImage,
      required this.position})
      : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight * 0.70,
      width: context.dynamicWidth * 0.90,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(UserCard._borderRadius), color: Colors.white, boxShadow: [
        BoxShadow(
          color: widget.isFirstCard ? Colors.black12.withOpacity(0.1) : Colors.transparent,
          blurRadius: 10.0,
          spreadRadius: 4,
          offset: const Offset(
            0.0,
            5.0,
          ),
        ),
      ]),
      margin: EdgeInsets.all(widget.position),
      child: Column(
        children: [
          Expanded(
            flex: 22,
            child: UserPhoto(
              userImage: widget.userImage,
              containerRadius: UserCard._borderRadius,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DislikeButton(
                  goLeft: widget.goLeft,
                ),
                LikeButton(
                  goRight: widget.goRight,
                ),
                const ChatButton(),
              ],
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
