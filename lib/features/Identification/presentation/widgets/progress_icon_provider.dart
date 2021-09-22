import 'package:flutter/material.dart';
import '../../../../core/constants/asset_paths.dart';

enum ProgresStatus { PREVIUS, CURRENT, FUTURE }

Image progressIcon(ProgresStatus status) {
  switch (status) {
    case ProgresStatus.PREVIUS:
      return Image.asset(AssetPaths.shared.STATUS_PREVIOUS);
    case ProgresStatus.CURRENT:
      return Image.asset(AssetPaths.shared.STATUS_CURRENT);
    case ProgresStatus.FUTURE:
      return Image.asset(AssetPaths.shared.STATUS_FUTURE);
    default:
      return Image.asset(AssetPaths.shared.STATUS_CURRENT);
  }
}
