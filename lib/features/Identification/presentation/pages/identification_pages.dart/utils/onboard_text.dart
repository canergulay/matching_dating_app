import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/structure/utils/extensions/textstyle_extension.dart';

AutoSizeText onBoardText(String text, BuildContext context) {
  return AutoSizeText(
    text,
    style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold).dynamicText(context: context, size: 5),
    maxLines: 1,
  );
}
