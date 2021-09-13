import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../core/components/buttons/grey_button.dart';
import '../../../../core/constants/asset_paths.dart';
import '../../../../core/ui/theme/palette.dart';
import '../../../../core/structure/utils/extensions/sizedBox_extension.dart';
import '../../../../core/structure/utils/extensions/context_extension.dart';

Container genderGreyButton({required String text, required bool isActive, required BuildContext context}) => greyContainer(
    padding: context.heightUnit * 2,
    child: Row(
      children: [
        Image.asset(
          isActive ? AssetPaths.STATUS_PREVIOUS : AssetPaths.STATUS_FUTURE,
          scale: 2,
        ),
        SizedBox().widthSpacer(context, 2),
        ourText(text, context, isActive)
      ],
    ),
    color: isActive ? Palette.BUTTONINACTIVE.withOpacity(0.45) : Palette.GENDERBUTTONINACTIVE);

AutoSizeText ourText(String text, BuildContext context, bool isActive) => AutoSizeText(
      text,
      maxLines: 1,
      maxFontSize: 14,
      style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.black, fontWeight: isActive ? FontWeight.w600 : FontWeight.normal),
    );
