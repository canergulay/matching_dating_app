import 'package:flutter/material.dart';
import 'package:matchangoo/core/structure/utils/widgets/background_widget_wlogo.dart';

class AuthenticationLoadingWidget extends StatelessWidget {
  const AuthenticationLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BackGroundContainerWithOutLogo(child: Container()));
  }
}
