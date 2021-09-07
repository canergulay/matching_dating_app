import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static final ImagePickerHelper _instance = ImagePickerHelper._init();
  static ImagePickerHelper get instance => _instance;

  late final ImagePicker imagePicker;

  ImagePickerHelper._init() {
    imagePicker = ImagePicker();
  }

  Future<XFile?> pickTheImage() async {
    return await imagePicker.pickImage(source: ImageSource.gallery);
  }
}
