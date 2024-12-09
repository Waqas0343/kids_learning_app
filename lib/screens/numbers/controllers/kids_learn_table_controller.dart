import 'package:get/get.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kids_learning_app/app_widgets/app_debug_widget/app_debug_pointer.dart';

class KidsLearnTableController extends GetxController {
  final FlutterTts flutterTts = FlutterTts();

  RxList<String> tables = <String>[].obs;
  Rx<int> currentLineIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    generateTables();
  }
  void generateTables() {
    for (int i = 1; i <= 20; i++) {
      String table = '';
      for (int j = 1; j <= 10; j++) {
        table += '$i x $j = ${i * j}\n';
      }
      tables.add(table);
    }
  }

  Future<void> speakTable(String text) async {
    await flutterTts.setLanguage("en-GB");

    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(4);
    var voices = await flutterTts.getLanguages;
    Debug.log("Available voices: $voices");

    List<String> lines = text.split("\n");

    for (int i = 0; i < lines.length; i++) {
      currentLineIndex.value = i;
      await flutterTts.speak(lines[i]);
      await Future.delayed(const Duration(seconds: 2));
    }
  }
}
