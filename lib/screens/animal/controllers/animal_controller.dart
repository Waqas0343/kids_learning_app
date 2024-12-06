import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import '../../../app_widgets/app_debug_widget/app_debug_pointer.dart';

class AnimalController extends GetxController {
  final FlutterTts flutterTts = FlutterTts();
  var selectedIndex = (-1).obs;
  final animalsList = [
    {'name': 'Cat', 'icon': 'assets/images/cat.jpg'},
    {'name': 'Dog', 'icon': 'assets/images/dog.png'},
    {'name': 'Lion', 'icon': 'assets/images/lion.png'},
    {'name': 'Elephant', 'icon': 'assets/images/elephan.png'},
    {'name': 'Tiger', 'icon':  'assets/images/tiger.png'},
    {'name': 'Bear', 'icon': 'assets/images/bear.png'},
    {'name': 'Giraffe', 'icon': 'assets/images/Giraffe.png'},
    {'name': 'Monkey', 'icon': 'assets/images/monkey.png'},
    {'name': 'Horse', 'icon': 'assets/images/horse.png'},
    {'name': 'Cow', 'icon': 'assets/images/cow.png'},
    {'name': 'Sheep', 'icon': 'assets/images/sheep.jpg'},
    {'name': 'Rabbit', 'icon': 'assets/images/rabit.jpeg'},
    {'name': 'Fish', 'icon': 'assets/images/fish.png'},
    {'name': 'Snake', 'icon': 'assets/images/snake.jpeg'},
    {'name': 'Kangaroo', 'icon': 'assets/images/kangaroo.png'},
    {'name': 'Penguin', 'icon': 'assets/images/penguin.jpg'},
    {'name': 'Koala', 'icon': 'assets/images/koala.png'},
    {'name': 'Panda', 'icon': 'assets/images/panda.jpeg'},
    {'name': 'Zebra', 'icon': 'assets/images/zebra.jpeg'},
    {'name': 'Crocodile', 'icon': 'assets/images/crocodile.png'},
    {'name': 'Turtle', 'icon': 'assets/images/turtle.png'},
    {'name': 'Duck', 'icon': 'assets/images/duck.jpeg'},
    {'name': 'Pig', 'icon': 'assets/images/pig.png'},
    {'name': 'Deer', 'icon': 'assets/images/deer.png'},
    {'name': 'Goat', 'icon': 'assets/images/goat.png'},
    {'name': 'Camel', 'icon': 'assets/images/camel.png'},
    {'name': 'Dolphin', 'icon': 'assets/images/dolphin.jpg'},
    {'name': 'Shark', 'icon': 'assets/images/shark.png'},
    {'name': 'Whale', 'icon': 'assets/images/whale.jpeg'},
    {'name': 'Octopus', 'icon': 'assets/images/octopus.jpeg'},
    {'name': 'Hippopotamus', 'icon': 'assets/images/hippopotamus.png'},
    {'name': 'Rhinoceros', 'icon': 'assets/images/rhinoceros.jpeg'},
    {'name': 'Wolf', 'icon': 'assets/images/wolf.jpeg'},
    {'name': 'Fox', 'icon': 'assets/images/fox.png'},
    {'name': 'Leopard', 'icon': 'assets/images/leopard.jpeg'},
    {'name': 'Cheetah', 'icon': 'assets/images/cheetah.jpeg'},
    {'name': 'Moose', 'icon': 'assets/images/moose.jpeg'},
    {'name': 'Otter', 'icon': 'assets/images/otter.png'},

  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onShapeClick(String shapeName) {
    Debug.log('Shape clicked: $shapeName');

  }
  void selectBird(int index) {
    selectedIndex.value = index;
  }
}