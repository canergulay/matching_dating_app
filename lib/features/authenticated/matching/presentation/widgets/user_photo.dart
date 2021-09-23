import 'package:flutter/material.dart';

class UserPhoto extends StatelessWidget {
  final double containerRadius;
  static const double _margin = 22;

  const UserPhoto({Key? key, required this.userImage, required this.containerRadius}) : super(key: key);

  final String userImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('clicked');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: _margin, horizontal: _margin - 2),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(containerRadius),
            child: Image.network(
              userImage,
              fit: BoxFit.scaleDown,
            )),
      ),
    );
  }
}
