import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:kids_learning_app/app_widgets/app_debug_widget/app_debug_pointer.dart';

class CharacterController extends GetxController {
  final textRecognizer = TextRecognizer();
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
    Debug.log("Drawing image set, size: ${image.buffer.lengthInBytes} bytes");
  }

  Future<void> captureImage() async {
    try {
      isLoading.value = true;
      final boundary = repaintKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
      if (boundary == null) throw Exception("RenderRepaintBoundary is null");

      final image = await boundary.toImage(pixelRatio: 5.0); // Increased resolution
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
      final boundary = repaintKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) {
        Get.snackbar('Error', 'RenderRepaintBoundary is null. Ensure widget is visible.');
        return;
      }

      final image = await boundary.toImage(pixelRatio: 5.0); // Increased resolution
      final width = image.width.toDouble();
      final height = image.height.toDouble();
      Debug.log("Captured image dimensions: width = $width, height = $height");

      final byteData = await image.toByteData(format: ImageByteFormat.rawRgba);
      if (byteData == null) throw Exception("Failed to retrieve byte data.");
      final bytes = byteData.buffer.asUint8List();

      final inputImage = InputImage.fromBytes(
        bytes: bytes,
        metadata: InputImageMetadata(
          size: Size(1280, 720),
          rotation: InputImageRotation.rotation0deg,
          format: InputImageFormat.nv21,
          bytesPerRow: 1280 * 4,
        ),
      );

      // OCR Processing
      final recognizedText = await textRecognizer.processImage(inputImage);
      Debug.log("Raw Detected Text: '${recognizedText.text}'");

      if (recognizedText.text.isEmpty) {
        Get.snackbar('Error', 'No text detected. Try a clearer drawing.');
        return;
      }

      final detectedText = recognizedText.text.replaceAll(RegExp(r'\s+'), '').toLowerCase();
      matchValuePercentage.value = calculateMatchPercentage(currentCharacter.value.toLowerCase(), detectedText);

      Get.snackbar(
        'Match Result',
        'Detected: $detectedText\nMatch: ${matchValuePercentage.value.toStringAsFixed(1)}%',
      );
    } catch (e) {
      Debug.log("Error during text recognition: $e");
      Get.snackbar('Error', 'Failed to recognize text. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

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
    getRandomCharacter();
    Debug.log("Canvas cleared.");
    update();
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
