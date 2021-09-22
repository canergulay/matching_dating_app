import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'HERE IS THE CHAT',
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
