import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/buttons/grey_button.dart';
import 'package:matchangoo/core/components/utils/image_picker.dart';
import 'package:matchangoo/core/components/utils/on_off_cubit.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';
import 'package:matchangoo/core/ui/components/headlines.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';
import 'package:matchangoo/features/Identification/presentation/cubit/photo_selection_cubit.dart';
import 'package:matchangoo/features/Identification/presentation/widgets/activatable_button.dart';

class PhotoSelectionScreen extends StatelessWidget {
  const PhotoSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
        create: (context) => OnOffCubit(),
        child: Column(
          children: [
            headLineSeven(context, "PHOTO_SELECTION.addphotos".tr()),
            SizedBox().heightSpacer(context, 2),
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 8),
                    child: GridView.builder(
                        itemCount: 9,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.75),
                        itemBuilder: (context, index) {
                          return photoWidget(context);
                        }),
                  ),
                  Positioned(
                      bottom: context.heightUnit * 7, child: Container(width: context.width * 0.7, child: activatableButton(onPressed: () {}))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget photoWidget(BuildContext context) {
  return BlocProvider(
    create: (context) => PhotoSelectionCubit(),
    child: BlocBuilder<PhotoSelectionCubit, PhotoSelectionState>(
      builder: (context, state) {
        if (state is PhotoNotSelected) {
          return GestureDetector(
            onTap: () => context.read<PhotoSelectionCubit>().selectPhoto(),
            child: greyContainer(
              color: Color(0xFFEBEFF0),
              borderWidth: 0,
              borderStyle: BorderStyle.none,
              bottomMargin: context.heightUnit * 2,
              leftMargin: context.widthUnit * 2,
              rightMargin: context.widthUnit * 2,
              child: Image.asset(
                AssetPaths.ADDPHOTO,
                scale: 3,
              ),
            ),
          );
        } else {
          final String path = (state as PhotoSelected).photo;
          return Container(
            margin: EdgeInsets.fromLTRB(context.widthUnit * 2, 0, context.widthUnit * 2, context.heightUnit * 2),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(
                    File(path),
                  ),
                ),
                Positioned(
                  child: Image.asset(
                    AssetPaths.DELPHOTO,
                    scale: 2,
                  ),
                  right: context.heightUnit,
                  top: context.heightUnit,
                )
              ],
            ),
          );
        }
      },
    ),
  );
}
