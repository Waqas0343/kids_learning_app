import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/character_controller.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CharacterController controller = Get.put(CharacterController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Characters"),
        backgroundColor: Colors.purple.shade400,
      ),
    );
  }
}
