import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:kids_learning_app/app_widgets/app_debug_widget/app_debug_pointer.dart';

class CharacterController extends GetxController {
  // Observable variables
  var currentCharacter = ''.obs;
  var matchPercentage = 0.0.obs;
  var drawnImage = Rx<Uint8List?>(null);

  // Keys for rendering and capturing canvas
  final GlobalKey drawingBoardKey = GlobalKey();
  final GlobalKey repaintKey = GlobalKey();

  // Text-to-Speech
  FlutterTts flutterTts = FlutterTts();

  @override
  void onInit() {
    super.onInit();
    getRandomCharacter();
  }

  /// Generates a random character from A-Z and a-z
  void getRandomCharacter() {
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    currentCharacter.value = (letters.split('')..shuffle()).first;
  }

  /// Sets the captured image as the drawn image
  void setDrawingImage(Uint8List image) {
    drawnImage.value = image;
  }

  /// Captures the current state of the drawing canvas
  Future<void> captureImage(GlobalKey repaintKey) async {
    try {
      final renderObject = repaintKey.currentContext?.findRenderObject();
      if (renderObject is RenderRepaintBoundary) {
        final boundary = renderObject;
        final image = await boundary.toImage();
        final byteData = await image.toByteData(format: ImageByteFormat.png);
        final bytes = byteData!.buffer.asUint8List();
        setDrawingImage(bytes);
        Debug.log("Debug: Image captured successfully.");
      } else {
        throw Exception('Drawing board render object is not a RenderRepaintBoundary');
      }
    } catch (e) {
      Debug.log('Error capturing image: $e');
      Get.snackbar('Error', 'Failed to capture the drawing. Please try again.');
    }
  }

  /// Compares the drawn image against the current character
  Future<void> checkMatch() async {
    if (drawnImage.value == null) {
      Get.snackbar('Error', 'Please draw the character first!');
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
      final recognizedText = await textRecognizer.processImage(inputImage);
      final detectedText = recognizedText.text.replaceAll(RegExp(r'\s+'), '').trim();

      if (detectedText.isEmpty) {
        Debug.log("Debug: No text detected in the image.");
        matchPercentage.value = 0.0;
        Get.snackbar('Try Again', 'No recognizable text. Please try again!');
        return;
      }

      Debug.log("Debug: Detected text - $detectedText");
      matchPercentage.value = calculateMatchPercentage(
        currentCharacter.value,
        detectedText,
      );

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
      Debug.log("Debug: Error during text recognition - $e");
      Get.snackbar('Error', 'Failed to recognize text. Please try again.');
    } finally {
      await textRecognizer.close();
      Debug.log("Debug: Text recognizer closed.");
    }
  }


  /// Calculates match percentage between expected and recognized characters
  double calculateMatchPercentage(String expected, String recognized) {
    int matches = 0;
    int minLength = expected.length > recognized.length ? recognized.length : expected.length;

    for (int i = 0; i < minLength; i++) {
      if (expected[i].toLowerCase() == recognized[i].toLowerCase()) {
        matches++;
      }
    }

    return (matches / expected.length) * 100.0;
  }

  /// Clears the drawing canvas and resets match percentage
  void clearCanvas() {
    drawnImage.value = null;
    matchPercentage.value = 0.0;
    Debug.log("Debug: Canvas cleared.");
  }

  /// Speaks out the current character using Text-to-Speech
  void speakCharacter(String character) async {
    try {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.speak(character);
      Debug.log("Debug: Speaking character - $character");
    } catch (e) {
      Debug.log("Debug: TTS error - $e");
      Get.snackbar('Error', 'Failed to play text-to-speech.');
    }
  }
}
