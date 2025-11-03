import 'package:get/get.dart';
import 'package:flutter_tts/flutter_tts.dart';

class UrduController extends GetxController {
  final FlutterTts flutterTts = FlutterTts();
  var selectedLetter = ''.obs;

  final RxList<String> urduAlphabets = <String>[
    "ا", "ب", "پ", "ت", "ٹ", "ث", "ج", "چ", "ح", "خ",
    "د", "ڈ", "ذ", "ر", "ڑ", "ز", "ژ", "س", "ش", "ص",
    "ض", "ط", "ظ", "ع", "غ", "ف", "ق", "ک", "گ", "ل",
    "م", "ن", "و", "ہ", "ء", "ی"
  ].obs;

  void selectLetter(String letter) {
    selectedLetter.value = letter;
  }

  Future<void> speakLetter(String letter) async {
    await flutterTts.setLanguage("ur-PK");
    await flutterTts.speak(letter);
  }

  @override
  void onClose() {
    flutterTts.stop();
    super.onClose();
  }
}
