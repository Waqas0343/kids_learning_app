import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/draw_animal_shape_controller.dart';

class DrawAnimalShape extends StatelessWidget {
  const DrawAnimalShape({super.key});

  @override
  Widget build(BuildContext context) {
    final DrawAnimalShapeController controller = Get.put(DrawAnimalShapeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Draw Animal Shape"),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
    );
  }
}
