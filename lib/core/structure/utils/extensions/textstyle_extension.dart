import 'package:flutter/material.dart';

import 'context_extension.dart';

extension TextStyleExtension on TextStyle {
  TextStyle dynamicText({required double size, required BuildContext context}) {
    return this.copyWith(fontSize: size * context.widthUnit);
  }
}
