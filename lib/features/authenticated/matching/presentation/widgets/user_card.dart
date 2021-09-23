import 'package:flutter/material.dart';
import 'package:matchangoo/core/components/buttons/animator_button.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/widgets/buttons/chat_button.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/widgets/user_photo.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'buttons/dislike_button.dart';
import 'buttons/like_button.dart';

class UserCard extends StatelessWidget {
  static const double _borderRadius = 16;
  final Color color;
  final String userImage;
  final double position;
  final VoidCallback goLeft;
  final VoidCallback goRight;
  const UserCard({Key? key, required this.color, required this.goLeft, required this.goRight, required this.userImage, required this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight * 0.70,
      width: context.dynamicWidth * 0.90,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(_borderRadius), color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12.withOpacity(0.05),
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
        children: [
          Expanded(
            flex: 22,
            child: UserPhoto(
              userImage: userImage,
              containerRadius: _borderRadius,
            ),
          ),
          Expanded(
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
          ),
          const Spacer()
        ],
      ),
    );
  }
}
