import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/Identification/data/repositories/upload_image_impl.dart';
import '../../../../core/components/utils/image_picker.dart';
import '../../../../core/components/utils/on_off_cubit.dart';

abstract class PhotoSelectionState {}

class Photos extends PhotoSelectionState {
  final List<String> photos;
  final List<bool> uploadstatus;

  Photos({required this.photos, required this.uploadstatus});
}

class PhotoSelectionCubit extends Cubit<PhotoSelectionState> {
  late OnOffCubit onOffCubit;
  UploadUserImageRepositary uploadUserImageRepositary;
  PhotoSelectionCubit(this.uploadUserImageRepositary) : super(Photos(photos: [], uploadstatus: [])) {
    onOffCubit = OnOffCubit();
  }

  Future<void> selectPhoto() async {
    XFile? file = await ImagePickerHelper.instance.pickTheImage();
    if (file != null) {
      final List<String> photos = (state as Photos).photos;
      final List<bool> uploadstatus = (state as Photos).uploadstatus;
      photos.add(file.path);
      uploadstatus.add(false);
      emit(Photos(photos: photos, uploadstatus: uploadstatus));
      Result<String> uploadresult = await uploadUserImageRepositary.uploadUserPhoto(file.path);
      uploadresult.when(error: (CustomError e) {}, success: (String image) {});
      checkOnOffButton();
    }
  }

  Future<void> deletePhoto(int index) async {
    final List<String> photos = photosInState;
    final List<bool> uploadstatus = uploadStatusInState;

    photos.removeAt(index);
    uploadstatus.removeAt(index);
    emit(Photos(photos: photos, uploadstatus: uploadstatus));
    checkOnOffButton();
  }

  void checkOnOffButton() {
    photosInState.length > 0 ? onOffCubit.on() : onOffCubit.off();
  }

  List<String> get photosInState => (state as Photos).photos;
  List<bool> get uploadStatusInState => (state as Photos).uploadstatus;
}
