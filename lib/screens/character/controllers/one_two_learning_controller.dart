import 'package:get/get.dart';
import 'package:flutter_tts/flutter_tts.dart';

class OneTwoLearningController extends GetxController {
  final FlutterTts flutterTts = FlutterTts();
  var numberWords = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    generateNumberWords();
  }

  void generateNumberWords() {
    List<String> words = [];
    for (int i = 1; i <= 500; i++) {
      words.add(numberToWords(i));
    }
    numberWords.assignAll(words);
  }

  Future<void> speak(String text) async {
    await flutterTts.speak(text);
  }

  String numberToWords(int number) {
    final ones = [
      "", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"
    ];
    final teens = [
      "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen",
      "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"
    ];
    final tens = [
      "", "", "Twenty", "Thirty", "Forty", "Fifty",
      "Sixty", "Seventy", "Eighty", "Ninety"
    ];

    if (number < 10) {
      return ones[number];
    } else if (number < 20) {
      return teens[number - 10];
    } else if (number < 100) {
      int ten = number ~/ 10;
      int one = number % 10;
      return "${tens[ten]}${one > 0 ? " ${ones[one]}" : ""}";
    } else if (number < 1000) {
      int hundred = number ~/ 100;
      int remainder = number % 100;
      String hundredPart = "${ones[hundred]} Hundred";
      if (remainder == 0) return hundredPart;
      return "$hundredPart and ${numberToWords(remainder)}";
    } else {
      return "Five Hundred";
    }
  }

  @override
  void onClose() {
    flutterTts.stop();
    super.onClose();
  }
}
