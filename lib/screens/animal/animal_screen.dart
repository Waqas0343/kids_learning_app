import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/animal_controller.dart';

class AnimalScreen extends StatelessWidget {
  const AnimalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AnimalController controller = Get.put(AnimalController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Anima'),
        backgroundColor: Colors.purple.shade400,
      ),
    );
  }
}
