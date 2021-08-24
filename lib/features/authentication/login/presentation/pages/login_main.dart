import 'package:flutter/material.dart';
import '../../../../../core/components/buttons/animated_button.dart';

import '../../../../../core/constants/app_constants.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/core/structure/utils/extensions/textstyle_extension.dart';

import '../../../../../core/structure/navigation/navigation_manager.dart';

class LoginMain extends StatelessWidget {
  const LoginMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                AppConstants.APP_NAME,
                style: Theme.of(context).textTheme.headline3?.dynamicText(size: 10, widthUnit: context.widthUnit),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedButton(
                  title: 'Create Account',
                  onPressed: () {
                    NavigationManager.instance.navigateToPage(path: '/register', arguments: 'nothing');
                    print('gmail');
                  },
                ),
                AnimatedButton(
                    title: 'Sign In',
                    onPressed: () {
                      Future.delayed(Duration(milliseconds: 150), () {
                        NavigationManager.instance.navigateToPage(path: '/identification', arguments: 'nothing');
                      });
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
