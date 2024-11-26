import 'package:get/get.dart';
import 'package:flutter_tts/flutter_tts.dart';

class CharactersController extends GetxController {
  final FlutterTts flutterTts = FlutterTts();
  var isUppercase = true.obs;
  var selectedCharacter = ''.obs;
  final List<String> uppercaseLetters = List.generate(26, (i) => String.fromCharCode(65 + i)); // A-Z
  final List<String> lowercaseLetters = List.generate(26, (i) => String.fromCharCode(97 + i)); // a-z


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void toggleCase() {
    isUppercase.value = !isUppercase.value;
    selectedCharacter.value = '';
  }

  void selectCharacter(String character) {
    selectedCharacter.value = character;
  }
  Future<void> speakCharacter(String character) async {
    await flutterTts.speak(character);
  }
  @override
  void onClose() {
    flutterTts.stop();
    super.onClose();
  }
}
