import 'package:flutter/material.dart';

import 'context_extension.dart';

extension SizedBoxExtension on SizedBox {
  SizedBox heightSpacer(BuildContext context, int size) {
    return SizedBox(height: context.heightUnit * size);
  }

  SizedBox widthSpacer(BuildContext context, int size) {
    return SizedBox(width: context.widthUnit * size);
  }
}
