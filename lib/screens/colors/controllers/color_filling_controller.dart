import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class ColorFillingController extends GetxController {
  FlutterTts flutterTts = FlutterTts();
  Rx<Color> currentFillColor = Colors.transparent.obs;
  late String targetColorName;
  late Color targetBorderColor;

  final List<Map<String, dynamic>> colorsList = [
    {'color': Colors.red, 'name': 'Red'},
    {'color': Colors.blue, 'name': 'Blue'},
    {'color': Colors.green, 'name': 'Green'},
    {'color': Colors.yellow, 'name': 'Yellow'},
    {'color': Colors.orange, 'name': 'Orange'},
    {'color': Colors.purple, 'name': 'Purple'},
    {'color': Colors.pink, 'name': 'Pink'},
    {'color': Colors.brown, 'name': 'Brown'},
    {'color': Colors.cyan, 'name': 'Cyan'},
    {'color': Colors.teal, 'name': 'Teal'},
    {'color': Colors.lime, 'name': 'Lime'},
    {'color': Colors.indigo, 'name': 'Indigo'},
    {'color': Colors.amber, 'name': 'Amber'},
    {'color': Colors.grey, 'name': 'Grey'},
    {'color': Colors.black, 'name': 'Black'},
    {'color': Colors.white, 'name': 'White'},
    {'color': const Color(0xFFFAEBD7), 'name': 'Antique White'},
    {'color': const Color(0xFF7FFFD4), 'name': 'Aquamarine'},
    {'color': const Color(0xFFF0FFFF), 'name': 'Azure'},
    {'color': const Color(0xFFF5F5DC), 'name': 'Beige'},
    {'color': const Color(0xFFFFE4C4), 'name': 'Bisque'},
    {'color': const Color(0xFFFFEBCD), 'name': 'Blanched Almond'},
    {'color': const Color(0xFF8A2BE2), 'name': 'Blue Violet'},
    {'color': const Color(0xFFA52A2A), 'name': 'Dark Brown'},
    {'color': const Color(0xFF5F9EA0), 'name': 'Cadet Blue'},
    {'color': const Color(0xFF7FFF00), 'name': 'Chartreuse'},
    {'color': const Color(0xFFD2691E), 'name': 'Chocolate'},
    {'color': const Color(0xFFFF7F50), 'name': 'Coral'},
    {'color': const Color(0xFF6495ED), 'name': 'Cornflower Blue'},
    {'color': const Color(0xFFFFF8DC), 'name': 'Cornsilk'},
    {'color': const Color(0xFFDC143C), 'name': 'Crimson'},
    {'color': const Color(0xFF00FFFF), 'name': 'Aqua'},
    {'color': const Color(0xFFB8860B), 'name': 'Dark Goldenrod'},
    {'color': const Color(0xFFA9A9A9), 'name': 'Dark Grey'},
    {'color': const Color(0xFF006400), 'name': 'Dark Green'},
    {'color': const Color(0xFFBDB76B), 'name': 'Dark Khaki'},
    {'color': const Color(0xFF8B008B), 'name': 'Dark Magenta'},
    {'color': const Color(0xFF556B2F), 'name': 'Dark Olive Green'},
    {'color': const Color(0xFFFF8C00), 'name': 'Dark Orange'},
    {'color': const Color(0xFF9932CC), 'name': 'Dark Orchid'},
    {'color': const Color(0xFF8B0000), 'name': 'Dark Red'},
    {'color': const Color(0xFFE9967A), 'name': 'Dark Salmon'},
    {'color': const Color(0xFF8FBC8F), 'name': 'Dark Sea Green'},
    {'color': const Color(0xFF483D8B), 'name': 'Dark Slate Blue'},
    {'color': const Color(0xFF2F4F4F), 'name': 'Dark Slate Grey'},
    {'color': const Color(0xFF00CED1), 'name': 'Dark Turquoise'},
    {'color': const Color(0xFF9400D3), 'name': 'Dark Violet'},
    {'color': const Color(0xFFFF1493), 'name': 'Deep Pink'},
    {'color': const Color(0xFF00BFFF), 'name': 'Deep Sky Blue'},
    {'color': const Color(0xFF696969), 'name': 'Dim Grey'},
    {'color': const Color(0xFF1E90FF), 'name': 'Dodger Blue'},
    {'color': const Color(0xFFB22222), 'name': 'Firebrick'},
    {'color': const Color(0xFFFFFAF0), 'name': 'Floral White'},
    {'color': const Color(0xFF228B22), 'name': 'Forest Green'},
    {'color': const Color(0xFFFF00FF), 'name': 'Magenta'},
    {'color': const Color(0xFFDCDCDC), 'name': 'Gainsboro'},
    {'color': const Color(0xFFF8F8FF), 'name': 'Ghost White'},
    {'color': const Color(0xFFFFD700), 'name': 'Gold'},
    {'color': const Color(0xFFDAA520), 'name': 'Goldenrod'},
    {'color': const Color(0xFFADFF2F), 'name': 'Green Yellow'},
    {'color': const Color(0xFFF0FFF0), 'name': 'Honeydew'},
    {'color': const Color(0xFFFF69B4), 'name': 'Hot Pink'},
    {'color': const Color(0xFFCD5C5C), 'name': 'Indian Red'},
    {'color': const Color(0xFF4B0082), 'name': 'Indigo'},
    {'color': const Color(0xFFFFFFF0), 'name': 'Ivory'},
    {'color': const Color(0xFFF0E68C), 'name': 'Khaki'},
    {'color': const Color(0xFFE6E6FA), 'name': 'Lavender'},
    {'color': const Color(0xFFFFF0F5), 'name': 'Lavender Blush'},
    {'color': const Color(0xFF7CFC00), 'name': 'Lawn Green'},
    {'color': const Color(0xFFFFFACD), 'name': 'Lemon Chiffon'},
    {'color': const Color(0xFFADD8E6), 'name': 'Light Blue'},
    {'color': const Color(0xFFF08080), 'name': 'Light Coral'},
    {'color': const Color(0xFFE0FFFF), 'name': 'Light Cyan'},
    {'color': const Color(0xFFFAFAD2), 'name': 'Light Goldenrod Yellow'},
    {'color': const Color(0xFFD3D3D3), 'name': 'Light Grey'},
    {'color': const Color(0xFF90EE90), 'name': 'Light Green'},
    {'color': const Color(0xFFFFB6C1), 'name': 'Light Pink'},
    {'color': const Color(0xFFFFA07A), 'name': 'Light Salmon'},
    {'color': const Color(0xFF20B2AA), 'name': 'Light Sea Green'},
    {'color': const Color(0xFF87CEFA), 'name': 'Light Sky Blue'},
    {'color': const Color(0xFF778899), 'name': 'Light Slate Grey'},
    {'color': const Color(0xFFB0C4DE), 'name': 'Light Steel Blue'},
    {'color': const Color(0xFFFFFFE0), 'name': 'Light Yellow'},
  ];

  void generateRandomTargetColor() {
    final randomColor = (colorsList..shuffle()).first;
    targetColorName = randomColor['name'];
    targetBorderColor = randomColor['color'];
    currentFillColor.value = Colors.transparent;
    update();
  }

  void checkAndFillColor(String selectedColorName, Color selectedColor) {
    if (selectedColorName == targetColorName) {
      currentFillColor.value = selectedColor;
      Get.snackbar(
        'Correct!',
        'You filled the shape correctly!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 1),
      );

      Future.delayed(const Duration(seconds: 1), () {
        generateRandomTargetColor();
      });
    } else {
      Get.snackbar('Incorrect!', 'Try again!',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
  void speakNumber(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }
  @override
  void onInit() {
    super.onInit();
    generateRandomTargetColor();
  }
}
