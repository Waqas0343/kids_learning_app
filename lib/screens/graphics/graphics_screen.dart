import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/graphics_controller.dart';

class GraphicsScreen extends StatelessWidget {
  const GraphicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GraphicsController controller = Get.put(GraphicsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Graphics"),
      ),
    );
  }
}
