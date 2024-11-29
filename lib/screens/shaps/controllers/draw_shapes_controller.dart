import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class DrawShapesController extends GetxController {
  FlutterTts flutterTts = FlutterTts();
  RxString currentNumber = ''.obs;
  var matchPercentage = 0.0.obs;
  var drawnImage = Rx<Uint8List?>(null);
  final GlobalKey repaintKey = GlobalKey();

  final shapesList = [
    {'name': 'Circle', 'shape': Icons.circle_outlined},
    {'name': 'Square', 'shape': Icons.crop_square},
    {'name': 'Triangle', 'shape': Icons.change_history},
    {'name': 'Star', 'shape': Icons.star},
    {'name': 'Rectangle', 'shape': Icons.crop_landscape},
    {'name': 'Pentagon', 'shape': Icons.pentagon},
    {'name': 'Hexagon', 'shape': Icons.hexagon},
    {'name': 'Diamond', 'shape': Icons.diamond},
    {'name': 'Oval', 'shape': Icons.egg},
    {'name': 'Heart', 'shape': Icons.favorite},
    {'name': 'Parallelogram', 'shape': Icons.directions},
    {'name': 'Arrow', 'shape': Icons.arrow_forward},
    {'name': 'Chevron', 'shape': Icons.expand_more},
    {'name': 'Cross', 'shape': Icons.add},
    {'name': 'Crescent', 'shape': Icons.nightlight},
    {'name': 'Star Border', 'shape': Icons.star_border},
    {'name': 'Cloud', 'shape': Icons.cloud},
    {'name': 'Gear', 'shape': Icons.settings},
    {'name': 'Flower', 'shape': Icons.local_florist},
    {'name': 'Badge', 'shape': Icons.verified},
    {'name': 'Speech Bubble', 'shape': Icons.chat},
    {'name': 'Lightning Bolt', 'shape': Icons.flash_on},
    {'name': 'Right Arrow', 'shape': Icons.arrow_forward},
    {'name': 'Left Arrow', 'shape': Icons.arrow_back},
    {'name': 'Up Arrow', 'shape': Icons.arrow_upward},
    {'name': 'Down Arrow', 'shape': Icons.arrow_downward},
    {'name': 'Plus', 'shape': Icons.add},
    {'name': 'Minus', 'shape': Icons.remove},
    {'name': 'Multiplication', 'shape': Icons.close},
    {'name': 'Division', 'shape': Icons.horizontal_rule},
    {'name': 'Infinity', 'shape': Icons.all_inclusive},
    {'name': 'Spiral', 'shape': Icons.loop},
    {'name': 'Hexagram', 'shape': Icons.grade},
  ].obs;

  Rx<Map<String, dynamic>> selectedShape = Rx<Map<String, dynamic>>({});

  @override
  void onInit() {
    super.onInit();
    pickRandomShape();
  }

  void pickRandomShape() {
    final randomIndex = Random().nextInt(shapesList.length);
    selectedShape.value = shapesList[randomIndex];
    update();
  }

  void setDrawingImage(Uint8List image) {
    drawnImage.value = image;
  }

  void clearCanvas() {
    drawnImage.value = null;
    update();
  }

  void speakNumber(String number) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(number);
  }
}
