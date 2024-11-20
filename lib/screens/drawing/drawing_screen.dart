import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/drawing_controller.dart';

class DrawingScreen extends StatelessWidget {
  const DrawingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DrawingController controller = Get.put(DrawingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Draw Drawing"),
      ),
    );
  }
}
