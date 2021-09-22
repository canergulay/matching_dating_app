import 'package:flutter/material.dart';
import 'package:matchangoo/core/components/widgets/button_container.dart';

class DrawerButton extends StatelessWidget {
  const DrawerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buttonContainer(context, child: const Icon(Icons.directions_railway_rounded));
  }
}
