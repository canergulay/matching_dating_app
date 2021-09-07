import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matchangoo/core/components/utils/image_picker.dart';
import 'package:matchangoo/features/authentication/register/presentation/bloc/register_bloc.dart';

abstract class PhotoSelectionState {}

class PhotoNotSelected extends PhotoSelectionState {}

class PhotoSelected extends PhotoSelectionState {
  final String photo;
  PhotoSelected({required this.photo});
}

class PhotoSelectionCubit extends Cubit<PhotoSelectionState> {
  PhotoSelectionCubit() : super(PhotoNotSelected());
  Future<void> selectPhoto() async {
    XFile? file = await ImagePickerHelper.instance.pickTheImage();
    if (file != null) {
      emit(PhotoSelected(photo: file.path));
    }
  }
}
