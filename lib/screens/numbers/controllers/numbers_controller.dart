import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class NumbersController extends GetxController {
  final FlutterTts _flutterTts = FlutterTts();
  final RxInt selectedNumber = (-1).obs;
  final RxInt currentPage = (1).obs;

  NumbersController() {
    _initializeTts();
  }

  void _initializeTts() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setPitch(1.0);
  }

  void speakNumber(int number) async {
    selectedNumber.value = number;
    await _flutterTts.speak(number.toString());
  }

  void changePage(int page) {
    currentPage.value = page;
    selectedNumber.value = 0;
  }

  @override
  void onClose() {
    _flutterTts.stop();
    super.onClose();
  }
}
