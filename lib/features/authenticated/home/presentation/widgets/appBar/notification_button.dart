import 'package:flutter/material.dart';
import 'package:matchangoo/core/components/buttons/animator_button.dart';
import 'package:matchangoo/core/components/widgets/button_container.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buttonContainer(context,
        child: AnimatorButton(
          onPressed: () {
            print('notification ');
          },
          upperBound: 0.3,
          childToBeAnimated: Image.asset(
            AssetPaths.shared.notification,
            scale: 2.31,
          ),
        ));
  }
}
