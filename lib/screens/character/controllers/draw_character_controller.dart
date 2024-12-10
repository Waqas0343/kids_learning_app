import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:kids_learning_app/app_widgets/app_debug_widget/app_debug_pointer.dart';
import 'package:path_provider/path_provider.dart';

class CharacterController extends GetxController {
  final textRecognizer = GoogleMlKit.vision.textRecognizer();
  var currentCharacter = ''.obs;
  var matchValuePercentage = 0.0.obs;
  var isLoading = false.obs;
  var drawnImage = Rx<Uint8List?>(null);
  final GlobalKey repaintKey = GlobalKey();
  FlutterTts flutterTts = FlutterTts();

  @override
  void onInit() {
    super.onInit();
    getRandomCharacter();
  }

  void getRandomCharacter() {
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    currentCharacter.value = (letters.split('')..shuffle()).first;
    Debug.log("Generated random character: ${currentCharacter.value}");
  }

  void setDrawingImage(Uint8List image) {
    drawnImage.value = image;
    Debug.log("Drawing image set, size: ${image.length} bytes");
  }

  Future<void> captureImage() async {
    try {
      isLoading.value = true;
      final boundary = repaintKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
      if (boundary == null) throw Exception("RenderRepaintBoundary is null");

      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ImageByteFormat.png);
      if (byteData != null) {
        final bytes = byteData.buffer.asUint8List();
        setDrawingImage(bytes);
        Debug.log("Captured image successfully.");
      } else {
        throw Exception("Failed to capture image.");
      }
    } catch (e) {
      Debug.log("Error capturing image: $e");
      Get.snackbar("Error", "Failed to capture the drawing. Please try again.");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> captureAndDetectText() async {
    if (drawnImage.value == null) {
      Get.snackbar('Error', 'Please draw the character first!');
      return;
    }

    isLoading.value = true;
    try {
      // Capture the drawn image from the widget
      final boundary = repaintKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) {
        Get.snackbar('Error', 'RenderRepaintBoundary is null. Ensure widget is visible.');
        return;
      }

      final image = await boundary.toImage(pixelRatio: 5.0);  // Adjust pixel ratio for better clarity
      final width = image.width.toDouble();
      final height = image.height.toDouble();
      print("Captured image dimensions: width = $width, height = $height");

      final byteData = await image.toByteData(format: ImageByteFormat.rawRgba);
      if (byteData == null) throw Exception("Failed to retrieve byte data.");
      final bytes = byteData.buffer.asUint8List();

      // Save the image for debugging
      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/captured_image.png';
      final imgFile = File(path)..writeAsBytesSync(bytes);
      print('Captured image saved to: $path');

      // Process image for OCR
      final inputImage = InputImage.fromBytes(
        bytes: bytes,
        metadata: InputImageMetadata(
          size: Size(width, height),
          rotation: InputImageRotation.rotation0deg,
          format: InputImageFormat.yv12,
          bytesPerRow: width.toInt() * 4,
        ),
      );

      // Run OCR on the image
      final recognizedText = await textRecognizer.processImage(inputImage);
      print("Raw Detected Text: '${recognizedText.text}'");  // Log raw text

      // If empty, show a message
      if (recognizedText.text.isEmpty) {
        Get.snackbar('Error', 'No text detected. Please try again with clearer input.');
        return;
      }

      final detectedText = recognizedText.text.replaceAll(RegExp(r'\s+'), '').toLowerCase();
      Get.snackbar('Detected Text', detectedText);  // Display final cleaned text
      print("Cleaned Detected Text: '$detectedText'");

    } catch (e) {
      Get.snackbar('Error', 'Failed to recognize text. Please try again.');
      print("Error during text recognition: $e");
    } finally {
      isLoading.value = false;
    }
  }






  // Levenshtein distance function for calculating the match percentage
  int levenshteinDistance(String a, String b) {
    final List<List<int>> matrix = List.generate(
      a.length + 1,
          (i) => List.generate(b.length + 1, (j) => 0),
    );

    for (int i = 0; i <= a.length; i++) {
      for (int j = 0; j <= b.length; j++) {
        if (i == 0) {
          matrix[i][j] = j;
        } else if (j == 0) {
          matrix[i][j] = i;
        } else {
          matrix[i][j] = [
            matrix[i - 1][j] + 1,
            matrix[i][j - 1] + 1,
            matrix[i - 1][j - 1] + (a[i - 1] == b[j - 1] ? 0 : 1)
          ].reduce((a, b) => a < b ? a : b);
        }
      }
    }

    return matrix[a.length][b.length];
  }


  double calculateMatchPercentage(String expected, String recognized) {
    int distance = levenshteinDistance(expected, recognized);
    int maxLength = expected.length > recognized.length ? expected.length : recognized.length;
    return (1 - (distance / maxLength)) * 100;
  }

  void clearCanvas() {
    drawnImage.value = null;
    matchValuePercentage.value = 0.0;
    Debug.log("Canvas cleared.");
  }

  void speakCharacter(String character) async {
    try {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.speak(character);
      Debug.log("Speaking character: $character");
    } catch (e) {
      Debug.log("TTS error: $e");
      Get.snackbar('Error', 'Failed to play text-to-speech.');
    }
  }

  @override
  void onClose() {
    textRecognizer.close();
    super.onClose();
  }
}
