import 'package:flutter/material.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';

class UserPhoto extends StatelessWidget {
  final double containerRadius;
  static const double _margin = 22;

  const UserPhoto({Key? key, required this.userImage, required this.containerRadius}) : super(key: key);

  final String? userImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: _margin, horizontal: _margin - 2),
      child: ClipRRect(borderRadius: BorderRadius.circular(containerRadius), child: imageGetter(userImage)),
    );
  }
}

Image imageGetter(String? userPhoto) {
  if (userPhoto != null) {
    return Image.network(userPhoto);
  } else {
    return Image.asset(AssetPaths.shared.disLikeBadge);
  }
}
