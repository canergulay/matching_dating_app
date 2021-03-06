import 'package:flutter/material.dart';
import '../../../../../core/structure/utils/extensions/textstyle_extension.dart';

Container emailCouldNotBeVerified(BuildContext context) => Container(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'EMAIL CANT BE VERIFIED!',
            style: Theme.of(context).textTheme.headline5?.dynamicText(size: 6, context: context),
          ),
        ],
      ),
    ));
