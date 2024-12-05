import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:kids_learning_app/app_widgets/app_debug_widget/app_debug_pointer.dart';

class CharacterController extends GetxController {
  final textRecognizer = GoogleMlKit.vision.textRecognizer();
  var currentCharacter = ''.obs;
  var matchPercentage = 0.0.obs;
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
      final boundary =
      repaintKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ImageByteFormat.png);
      if (byteData != null) {
        final bytes = byteData.buffer.asUint8List();
        setDrawingImage(bytes);
        Debug.log("Captured image successfully.");
      }
    } catch (e) {
      Debug.log("Error capturing image: $e");
      Get.snackbar("Error", "Failed to capture the drawing. Please try again.");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> checkMatch() async {
    if (drawnImage.value == null) {
      Get.snackbar('Error', 'Please draw the character first!');
      return;
    }

    isLoading.value = true;

    try {
      final boundary = repaintKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) {
        throw Exception("RenderRepaintBoundary is null. Ensure the widget is visible.");
      }

      final image = await boundary.toImage();
      final width = image.width.toDouble();
      final height = image.height.toDouble();

      // Ensure we are using the correct format
      final byteData = await image.toByteData(format: ImageByteFormat.rawRgba);
      if (byteData == null) throw Exception("Failed to retrieve byte data.");

      final bytes = byteData.buffer.asUint8List();

      // Adjust the format and metadata to align with rawRgba
      final inputImage = InputImage.fromBytes(
        bytes: bytes,
        metadata: InputImageMetadata(
          size: Size(width, height),
          rotation: InputImageRotation.rotation0deg,
          format: InputImageFormat.yv12, // Align with rawRgba format
          bytesPerRow: width.toInt() * 4, // Ensure accurate row size
        ),
      );

      final recognizedText = await textRecognizer.processImage(inputImage);
      final detectedText = recognizedText.text.replaceAll(RegExp(r'\s+'), '').toString();

      Debug.log("Detected text: $detectedText");

      if (detectedText.isEmpty) {
        matchPercentage.value = 0.0;
        Get.snackbar('Try Again', 'No recognizable text. Please try again!');
        return;
      }

      final normalizedExpected = currentCharacter.value.trim().toLowerCase();
      final normalizedDetected = detectedText.trim().toLowerCase();
      matchPercentage.value = calculateMatchPercentage(normalizedExpected, normalizedDetected);

      if (matchPercentage.value > 80.0) {
        Get.snackbar('Success', 'Good job! Next character coming up.');
        getRandomCharacter();
      } else {
        Get.snackbar(
          'Try Again',
          'Keep practicing! Match: ${matchPercentage.value.toStringAsFixed(1)}%',
        );
      }
    } catch (e) {
      Debug.log("Error during text recognition: $e");
      Get.snackbar('Error', 'Failed to recognize text. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

  int levenshtein(String a, String b) {
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
    int distance = levenshtein(expected, recognized);
    int maxLength =
    expected.length > recognized.length ? expected.length : recognized.length;
    return (1 - (distance / maxLength)) * 100;
  }

  void clearCanvas() {
    drawnImage.value = null;
    matchPercentage.value = 0.0;
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
