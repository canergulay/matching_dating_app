import 'package:flutter/material.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';

Container onboardContainerColumn({required BuildContext context, required List<Widget> children}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 3, vertical: context.heightUnit * 3.5),
    child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: children),
  );
}
