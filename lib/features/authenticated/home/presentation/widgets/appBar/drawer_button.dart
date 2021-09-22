import 'package:flutter/material.dart';
import 'package:matchangoo/core/components/buttons/animator_button.dart';
import 'package:matchangoo/core/components/widgets/button_container.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';

class DrawerButton extends StatelessWidget {
  const DrawerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buttonContainer(context,
        child: AnimatorButton(
          onPressed: () {
            print('drawer');
          },
          upperBound: 0.3,
          childToBeAnimated: Image.asset(
            AssetPaths.shared.drawer,
            scale: 2.31,
          ),
        ));
  }
}
