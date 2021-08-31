import 'package:flutter/material.dart';

import '../../structure/utils/extensions/textstyle_extension.dart';

Text headLineOne(BuildContext context, String text) =>
    Text(text, style: Theme.of(context).textTheme.headline1?.dynamicText(context: context, size: 10));

Text headLineTwo(BuildContext context, String text) =>
    Text(text, style: Theme.of(context).textTheme.headline2?.dynamicText(context: context, size: 10));

Text headLineThree(BuildContext context, String text, {double size = 5}) => Text(text,
    textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.headline2?.dynamicText(context: context, size: size).copyWith(color: Colors.black38));

Text headLineFour(BuildContext context, String text) =>
    Text(text, style: Theme.of(context).textTheme.headline2?.dynamicText(context: context, size: 5).copyWith(color: Colors.black38));

Text headLineFive(BuildContext context, String text) =>
    Text(text, style: Theme.of(context).textTheme.headline3?.dynamicText(context: context, size: 7));
