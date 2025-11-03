import 'dart:ui';

import 'package:get/get.dart';
import 'package:flutter_tts/flutter_tts.dart';

class UrduController extends GetxController {
  final FlutterTts flutterTts = FlutterTts();
  var selectedLetter = ''.obs;
  var isSpeaking = false.obs;
  var urduVoiceAvailable = false.obs;

  final RxList<String> urduAlphabets = <String>[
    "ا", "ب", "پ", "ت", "ٹ", "ث", "ج", "چ", "ح", "خ",
    "د", "ڈ", "ذ", "ر", "ڑ", "ز", "ژ", "س", "ش", "ص",
    "ض", "ط", "ظ", "ع", "غ", "ف", "ق", "ک", "گ", "ل",
    "م", "ن", "و", "ہ", "ء", "ی"
  ].obs;

  @override
  void onInit() {
    super.onInit();
    _checkVoices();
  }

  Future<void> _checkVoices() async {
    var voices = await flutterTts.getVoices;
    urduVoiceAvailable.value = voices.any(
          (v) => v['locale'].toString().toLowerCase().contains('ur'),
    );

    if (!urduVoiceAvailable.value) {
      Get.snackbar(
        "اردو آواز دستیاب نہیں",
        "برائے مہربانی iPhone کی Settings > Accessibility > Spoken Content > Voices میں جا کر اردو آواز ڈاؤن لوڈ کریں۔",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFFBE9E7),
        colorText: const Color(0xFFB71C1C),
      );
    }
  }

  void selectLetter(String letter) {
    selectedLetter.value = letter;
  }

  Future<void> speakLetter(String letter) async {
    var voices = await flutterTts.getVoices;
    dynamic urduVoice;

    for (var v in voices) {
      if (v['locale'].toString().toLowerCase().contains('ur')) {
        urduVoice = v;
        break;
      }
    }

    if (urduVoice != null) {
      await flutterTts.setVoice({
        "name": urduVoice['name'],
        "locale": urduVoice['locale'],
      });
      await flutterTts.setLanguage(urduVoice['locale']);
      await flutterTts.setSpeechRate(0.4);
      await flutterTts.setPitch(1.0);
    } else {
      await flutterTts.setLanguage("ar-001");
    }

    await flutterTts.speak(letter);
  }

  @override
  void onClose() {
    flutterTts.stop();
    super.onClose();
  }
}
