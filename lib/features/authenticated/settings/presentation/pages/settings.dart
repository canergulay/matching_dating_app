import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'HERE IS THE SETTINGS',
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
