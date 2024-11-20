import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/shapes_controller.dart';

class ShapesScreen extends StatelessWidget {
  const ShapesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ShapesController controller = Get.put(ShapesController());
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Learn Shap"),
      ),
    );
  }
}
