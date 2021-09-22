import 'package:flutter/material.dart';
import 'package:matchangoo/features/matching/presentation/widgets/user_photo.dart';

class UserCard extends StatelessWidget {
  static const double _borderRadius = 16;
  final Color color;
  final String userImage;
  final double position;
  const UserCard({Key? key, required this.color, required this.userImage, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(_borderRadius), color: Colors.white, boxShadow: [
        BoxShadow(
          color: const Color(0xFF000000).withAlpha(11),
          blurRadius: 6.0,
          spreadRadius: 5.0,
          offset: const Offset(
            0.0,
            3.0,
          ),
        ),
      ]),
      margin: EdgeInsets.all(position),
      child: Column(
        children: [
          Expanded(
            flex: 13,
            child: UserPhoto(
              userImage: userImage,
              containerRadius: _borderRadius,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // TODO: buttons
                IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit)),

                IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit)),
              ],
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
