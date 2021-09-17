import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matchangoo/core/appetizers/enums.dart/toast_type_enum.dart';
import 'package:matchangoo/core/components/toasts/toast_manager.dart';
import 'package:matchangoo/core/components/toasts/toast_widgets.dart/general_toast.dart';
import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/Identification/data/repositories/upload_image_impl.dart';
import '../../../../core/components/utils/image_picker.dart';
import '../../../../core/components/utils/on_off_cubit.dart';

abstract class PhotoSelectionState {}

class Photos extends PhotoSelectionState {
  final List<String> images;

  final List<String> imageURL;
  Photos({required this.images, required this.imageURL});
}

class PhotoSelectionCubit extends Cubit<PhotoSelectionState> {
  late OnOffCubit onOffCubit;
  UploadUserImageRepositary uploadUserImageRepositary;
  PhotoSelectionCubit(this.uploadUserImageRepositary) : super(Photos(images: [], imageURL: [])) {
    onOffCubit = OnOffCubit();
  }

  Future<void> selectPhoto(BuildContext context) async {
    XFile? file = await ImagePickerHelper.instance.pickTheImage();
    if (file != null) {
      final List<String> images = (state as Photos).images;

      final List<String> imageURL = (state as Photos).imageURL;
      images.add(file.path);
      imageURL.add('loading');
      emit(Photos(images: images, imageURL: imageURL));
      onOffCubit.off();
      Result<String> uploadresult = await uploadUserImageRepositary.uploadUserPhoto(file.path);
      uploadresult.when(error: (CustomError e) {
        showUnexpectedError(context);
        images.removeLast();
        imageURL.removeLast();
      }, success: (String image) {
        imageURL.last = image;
      });
      emit(Photos(images: images, imageURL: imageURL));
      checkOnOffButton();
    }
  }

  Future<void> deletePhoto(int index) async {
    final List<String> images = imagesInState;
    final List<String> imageURL = imageURLinState;

    images.removeAt(index);
    imageURLinState.removeAt(index);
    emit(Photos(images: images, imageURL: imageURL));
    checkOnOffButton();
  }

  void checkOnOffButton() {
    imageURLinState.isNotEmpty ? onOffCubit.on() : onOffCubit.off();
  }

  void showUnexpectedError(BuildContext context) {
    ToastShower.instance.showMyToast(
        context,
        GeneralToast(
          type: ToastType.bad,
          title: 'ERROR.TITLES.ONE'.tr(),
          message: "ERROR.MESSAGES.TWO".tr(),
        ));
  }

  List<String> get imagesInState => (state as Photos).images;
  List<String> get imageURLinState => (state as Photos).imageURL;
}
