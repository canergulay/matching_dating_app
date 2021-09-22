import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'HERE IS THE PROFİLE',
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
