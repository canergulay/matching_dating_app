import 'package:flutter/material.dart';
import '../../../../core/ui/theme/palette.dart';

Container araLine({
  required int myIndex,
  required int stateIndex,
}) {
  return Container(height: 1, color: myIndex < stateIndex ? Palette.ICONPINK : Palette.ICONGREY.withOpacity(0.5));
}
