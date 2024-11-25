import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:get/get.dart';
import 'package:kids_learning_app/app_widgets/toaster.dart';

class DrawingScreenController extends GetxController {
  late DrawingController boardController;
  final Rx<Color> brushColor = Colors.black.obs;
  GlobalKey boardKey = GlobalKey();
  final RxDouble brushSize = 5.0.obs;

  @override
  void onInit() {
    boardController = DrawingController();
    super.onInit();
  }

  Future<void> saveImage() async {
    try {
      final imageData = await boardController.getImageData();
      if (imageData == null) {
        Toaster.showToast('Please Draw Any Image');
        return;
      }

      final directory = Directory('/storage/emulated/0/Pictures');
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
      }

      final path = "${directory.path}/drawing.png";
      final file = File(path);

      await file.writeAsBytes(imageData.buffer.asInt8List());
      Toaster.showToast('Drawing Saved At: $path');
    } catch (e) {
      Toaster.showToast('Failed to save drawing: $e');
    }
  }
}


