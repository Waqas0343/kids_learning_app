import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import '../../../app_widgets/app_debug_widget/app_debug_pointer.dart';

class BirdsController extends GetxController {
  var selectedIndex = (-1).obs;
  final FlutterTts flutterTts = FlutterTts();
  final birdsList = [
    {'name': 'Parrot', 'icon': 'assets/images/parrot.png'},
    {'name': 'Peacock', 'icon': 'assets/images/peacock.jpeg'},
    {'name': 'Sparrow', 'icon': 'assets/images/sparrow.jpeg'},
    {'name': 'Pigeon', 'icon': 'assets/images/pigeon.jpeg'},
    {'name': 'Crow', 'icon': 'assets/images/crow.png'},
    {'name': 'Eagle', 'icon': 'assets/images/eagle.png'},
    {'name': 'Ostrich', 'icon': 'assets/images/ostrich.jpg'},
    {'name': 'Penguin', 'icon': 'assets/images/penguin.jpeg'},
    {'name': 'Flamingo', 'icon': 'assets/images/flamingo.png'},
    {'name': 'Swan', 'icon': 'assets/images/swan.png'},
    {'name': 'Duck', 'icon': 'assets/images/duck.jpeg'},
    {'name': 'Goose', 'icon': 'assets/images/goose.jpeg'},
    {'name': 'Hawk', 'icon': 'assets/images/hawk.jpeg'},
    {'name': 'Falcon', 'icon': 'assets/images/falcon.jpeg'},
    {'name': 'Seagull', 'icon': 'assets/images/seagull.jpeg'},
    {'name': 'Kingfisher', 'icon': 'assets/images/kingfisher.jpeg'},
    {'name': 'Woodpecker', 'icon': 'assets/images/woodpecker.jpeg'},
    {'name': 'Robin', 'icon': 'assets/images/robin.jpeg'},
    {'name': 'Blue Jay', 'icon': 'assets/images/blueJay.jpeg'},
    {'name': 'Cardinal', 'icon': 'assets/images/cardinal.jpeg'},
    {'name': 'Hummingbird', 'icon': 'assets/images/hummingbird.jpeg'},
    {'name': 'Canary', 'icon': 'assets/images/canary.jpeg'},
    {'name': 'Cockatoo', 'icon': 'assets/images/cockatoo.jpg'},
    {'name': 'Macaw', 'icon': 'assets/images/macaw.jpeg'},
    {'name': 'Toucan', 'icon': 'assets/images/toucan.jpeg'},
    {'name': 'Quail', 'icon': 'assets/images/quail.png'},
    {'name': 'Turkey', 'icon': 'assets/images/turkey.jpeg'},
    {'name': 'Chicken', 'icon': 'assets/images/chicken.png'},
    {'name': 'Rooster', 'icon': 'assets/images/rooster.jpeg'},
    {'name': 'Dove', 'icon': 'assets/images/dove.png'},
    {'name': 'Albatross', 'icon': 'assets/images/albatross.jpeg'},
    {'name': 'Cormorant', 'icon': 'assets/images/cormorant.png'},
    {'name': 'Heron', 'icon': 'assets/images/heron.png'},
    {'name': 'Ibis', 'icon': 'assets/images/ibis.jpeg'},
    {'name': 'Pelican', 'icon': 'assets/images/pelican.jpg'},
    {'name': 'Stork', 'icon': 'assets/images/stork.jpeg'},
    {'name': 'Swift', 'icon': 'assets/images/swift.jpg'},
    {'name': 'Kookaburra', 'icon': 'assets/images/kookaburra.jpeg'},
    {'name': 'Nightingale', 'icon': 'assets/images/nightingale.jpeg'},
    {'name': 'Cuckoo', 'icon': 'assets/images/cuckoo.jpeg'},
    {'name': 'Kiwi', 'icon': 'assets/images/kiwi.jpeg'},
    {'name': 'Lyrebird', 'icon': 'assets/images/lyrebird.jpg'},
    {'name': 'Magpie', 'icon': 'assets/images/magpie.jpeg'},
    {'name': 'Mockingbird', 'icon': 'assets/images/mockingbird.png'},
    {'name': 'Owl', 'icon': 'assets/images/owl.jpeg'},
    {'name': 'Raven', 'icon': 'assets/images/raven.png'},
    {'name': 'Starling', 'icon': 'assets/images/starling.jpeg'},
    {'name': 'Vulture', 'icon': 'assets/images/vulture.jpeg'},
    {'name': 'Wren', 'icon': 'assets/images/wren.jpeg'},
    {'name': 'Bald Eagle', 'icon': 'assets/images/baldEagle.jpg'},
    {'name': 'Sandpiper', 'icon': 'assets/images/sandpiper.png'},
    {'name': 'Puffin', 'icon': 'assets/images/puffin.png'},
    {'name': 'Hornbill', 'icon': 'assets/images/hornbill.jpeg'},
    {'name': 'Blackbird', 'icon': 'assets/images/blackbird.jpg'},
    {'name': 'Finch', 'icon': 'assets/images/finch.jpeg'},
    {'name': 'Crane', 'icon': 'assets/images/crane.jpg'},
    {'name': 'Cassowary', 'icon': 'assets/images/cassowary.jpeg'},
    {'name': 'Chickadee', 'icon': 'assets/images/chickadee.jpeg'},
    {'name': 'Titmouse', 'icon': 'assets/images/titmouse.png'},
    {'name': 'Lapwing', 'icon': 'assets/images/lapwing.jpeg'},
    {'name': 'Rail', 'icon': 'assets/images/rail.png'},
    {'name': 'Snipe', 'icon': 'assets/images/snipe.jpeg'},
    {'name': 'Tern', 'icon': 'assets/images/tern.jpeg'},
    {'name': 'Bittern', 'icon': 'assets/images/bittern.png'},
    {'name': 'Egret', 'icon': 'assets/images/egret.jpeg'},
    {'name': 'Weaverbird', 'icon': 'assets/images/weaverbird.jpg'},
    {'name': 'Bee-eater', 'icon': 'assets/images/bee-eater.png'},
    {'name': 'Roller', 'icon': 'assets/images/roller.jpeg'},
    {'name': 'Hoopoe', 'icon': 'assets/images/hoopoe.jpeg'},
    {'name': 'Jay', 'icon': 'assets/images/jay.jpeg'},
    {'name': 'Butterfly', 'icon': 'assets/images/butterfly.jpeg'},
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
