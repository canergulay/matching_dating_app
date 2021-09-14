import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/components/buttons/grey_button.dart';
import '../../../../../../core/components/utils/get_out_of_here.dart';

import '../../../../../../core/constants/asset_paths.dart';
import '../../../../../../core/ui/components/headlines.dart';
import '../../../../../../core/structure/utils/extensions/sizedBox_extension.dart';
import '../../../../../../core/structure/utils/extensions/context_extension.dart';
import '../../../cubit/identification_cubit.dart';
import '../../../cubit/photo_selection_cubit.dart';
import '../../../widgets/activatable_button.dart';
import '../../../../../authentication/register/presentation/bloc/register_bloc.dart';

class PhotoSelectionScreen extends StatefulWidget {
  const PhotoSelectionScreen({Key? key}) : super(key: key);

  @override
  _PhotoSelectionScreenState createState() => _PhotoSelectionScreenState();
}

class _PhotoSelectionScreenState extends State<PhotoSelectionScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PhotoSelectionCubit()),
        BlocProvider(create: (context) => context.read<PhotoSelectionCubit>().onOffCubit),
      ],
      child: BlocBuilder<PhotoSelectionCubit, PhotoSelectionState>(
        builder: (context, state) {
          final List<String> photos = (state as Photos).photos;
          return Column(
            children: [
              headLineSeven(context, "PHOTO_SELECTION.addphotos".tr()),
              SizedBox().heightSpacer(context, 2),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 8),
                    child: TweenAnimationBuilder<double>(
                      builder: (context, tween, child) {
                        return Transform.scale(
                          scale: 0.2 + tween,
                          child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: 9,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.75),
                              itemBuilder: (context, i) {
                                return photoWidget(context, photo: photos.length > i ? photos[i] : null, index: i);
                              }),
                        );
                      },
                      duration: Duration(milliseconds: 531),
                      tween: Tween<double>(begin: 0, end: 0.8),
                      curve: Curves.elasticIn,
                    ),
                  ),
                  Positioned(
                      bottom: context.heightUnit * 0.1,
                      child: Container(
                          width: context.width * 0.7,
                          child: activatableButton(onPressed: () {
                            context.read<IdentificationCubit>().registrationEntity.setPhotos = photos;
                            context.read<RegisterBloc>().add(Completed());
                          }))),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}

Widget photoWidget(BuildContext context, {required int index, String? photo}) {
  if (photo == null) {
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
    return Container(
      margin: EdgeInsets.fromLTRB(context.widthUnit * 2, 0, context.widthUnit * 2, context.heightUnit * 2),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.file(
              File(photo),
            ),
          ),
          Positioned(
            child: GestureDetector(
              onTap: () async {
                OkCancelResult sure =
                    await showSureDialog(context: context, title: 'ARE_YOU_SURE.title'.tr(), message: 'ARE_YOU_SURE.photomessage'.tr());
                if (sure == OkCancelResult.ok) {
                  context.read<PhotoSelectionCubit>().deletePhoto(index);
                }
              },
              child: Image.asset(
                AssetPaths.DELPHOTO,
                scale: 2,
              ),
            ),
            right: context.heightUnit,
            top: context.heightUnit,
          )
        ],
      ),
    );
  }
}