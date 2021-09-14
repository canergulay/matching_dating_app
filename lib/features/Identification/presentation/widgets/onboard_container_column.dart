import 'package:flutter/material.dart';
import '../../../../core/structure/utils/extensions/context_extension.dart';

Container onboardContainerColumn({required BuildContext context, required List<Widget> children}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 6, vertical: context.heightUnit * 1),
    child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: children),
  );
}
