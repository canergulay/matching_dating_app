import 'package:flutter/material.dart';

class UserPhoto extends StatelessWidget {
  final double containerRadius;
  static const double _margin = 16;

  const UserPhoto({Key? key, required this.userImage, required this.containerRadius}) : super(key: key);

  final String userImage;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(containerRadius)),
        margin: const EdgeInsets.all(_margin),
        alignment: Alignment.topCenter,
        child: Image.network(
          userImage,
          fit: BoxFit.fitHeight,
        ));
  }
}
