import 'package:flutter/material.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';
import 'package:matchangoo/core/structure/utils/extensions/textstyle_extension.dart';

Container emailCouldNotBeVerified(BuildContext context) => Container(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'EMAIL CANT BE VERIFIED!',
            style: Theme.of(context).textTheme.headline5?.dynamicText(size: 6, widthUnit: context.widthUnit),
          ),
        ],
      ),
    ));
