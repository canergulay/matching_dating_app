import 'package:flutter/material.dart';
import 'package:matchangoo/core/components/widgets/button_container.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buttonContainer(context, child: const Icon(Icons.notifications));
  }
}
