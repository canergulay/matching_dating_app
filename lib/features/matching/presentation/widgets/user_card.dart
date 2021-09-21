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
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(_borderRadius), color: Colors.white, boxShadow: const [BoxShadow(spreadRadius: 0.5)]),
      margin: EdgeInsets.all(20 * position),
      child: Column(
        children: [
          Expanded(
            flex: 10,
            child: UserPhoto(
              userImage: userImage,
              containerRadius: 30,
            ),
          ),
          Expanded(
            flex: 2,
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
