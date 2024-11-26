import 'dart:typed_data';
import 'dart:ui';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import '../../../app_widgets/app_debug_widget/app_debug_pointer.dart';

class DrawNumberController extends GetxController {
  var currentNumber = ''.obs;
  var matchPercentage = 0.0.obs;
  var drawnImage = Rx<Uint8List?>(null);
  final GlobalKey drawingBoardKey = GlobalKey();
  final GlobalKey repaintKey = GlobalKey();
  FlutterTts flutterTts = FlutterTts();

  @override
  void onInit() {
    getRandomNumber();
    super.onInit();
  }

  void getRandomNumber() {
    final random = Random();
    currentNumber.value = random.nextInt(2000).toString();
  }

  void setDrawingImage(Uint8List image) {
    drawnImage.value = image;
  }

  void clearCanvas() {
    drawnImage.value = null;
    update();
  }

  Future<void> captureImage(GlobalKey repaintKey) async {
    try {
      final renderObject = repaintKey.currentContext?.findRenderObject();
      if (renderObject is RenderRepaintBoundary) {
        final boundary = renderObject;
        final image = await boundary.toImage();
        final byteData = await image.toByteData(format: ImageByteFormat.png);
        final bytes = byteData!.buffer.asUint8List();

        setDrawingImage(bytes);
      } else {
        throw Exception('Drawing board render object is not a RenderRepaintBoundary');
      }
    } catch (e) {
      debugPrint('Error capturing image: $e');
    }
  }

  Future<void> checkMatch() async {
    if (drawnImage.value == null) {
      Get.snackbar('Error', 'Please draw the number first!');
      return;
    }
    final textRecognizer = GoogleMlKit.vision.textRecognizer();
    final inputImage = InputImage.fromBytes(
      bytes: drawnImage.value!,
      metadata: InputImageMetadata(
        size: const Size(300, 300),
        rotation: InputImageRotation.rotation0deg,
        format: InputImageFormat.nv21,
        bytesPerRow: 300,
      ),
    );
    try {
      final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
      String recognizedNumber = recognizedText.text.replaceAll(RegExp(r'\s+'), '').trim();

      Debug.log("Recognized Text: $recognizedNumber");

      if (recognizedNumber.isEmpty) {
        matchPercentage.value = 0.0;
        Get.snackbar('Try Again', 'No recognizable text. Please try again!');
      } else {
        matchPercentage.value = calculateMatchPercentage(currentNumber.value, recognizedNumber);
      }
      Debug.log("Match Percentage: ${matchPercentage.value}"); // Debug log
      if (matchPercentage.value > 80.0) {
        Get.snackbar('Success', 'Good job! Next number coming up.');
        getRandomNumber();
      } else {
        Get.snackbar('Try Again', 'Keep practicing! Match: ${matchPercentage.value.toStringAsFixed(1)}%');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to recognize text: $e');
    } finally {
      textRecognizer.close();
    }
  }

  double calculateMatchPercentage(String expected, String recognized) {
    int matches = 0;
    int length = expected.length > recognized.length ? recognized.length : expected.length;
    for (int i = 0; i < length; i++) {
      if (expected[i].toLowerCase() == recognized[i].toLowerCase()) {
        matches++;
      }
    }
    return (matches / expected.length) * 100.0;
  }

  void speakNumber(String number) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(number);
  }
}
