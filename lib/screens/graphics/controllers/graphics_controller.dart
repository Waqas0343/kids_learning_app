import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class GraphicsController extends GetxController {
  var selectedImage = Rx<File?>(null);
  var selectedTool = 'none'.obs;
  var selectedColor = Colors.black.obs;
  var textSize = 20.0.obs;

  final ImagePicker _picker = ImagePicker();
  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  Future<void> captureImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }
}