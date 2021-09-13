import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/components/utils/image_picker.dart';
import '../../../../core/components/utils/on_off_cubit.dart';

abstract class PhotoSelectionState {}

class Photos extends PhotoSelectionState {
  final List<String> photos;

  Photos({required this.photos});
}

class PhotoSelectionCubit extends Cubit<PhotoSelectionState> {
  late OnOffCubit onOffCubit;
  PhotoSelectionCubit() : super(Photos(photos: [])) {
    onOffCubit = OnOffCubit();
  }

  Future<void> selectPhoto() async {
    XFile? file = await ImagePickerHelper.instance.pickTheImage();
    if (file != null) {
      final List<String> photos = (state as Photos).photos;
      photos.add(file.path);
      emit(Photos(photos: photos));
      checkOnOffButton();
    }
  }

  Future<void> deletePhoto(int index) async {
    List<String> photos = photosInState;
    photos.removeAt(index);
    emit(Photos(photos: photos));
    checkOnOffButton();
  }

  void checkOnOffButton() {
    photosInState.length > 0 ? onOffCubit.on() : onOffCubit.off();
  }

  List<String> get photosInState => (state as Photos).photos;
}
