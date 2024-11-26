import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/draw_number_controller.dart';

class DrawNumberScreen extends StatelessWidget {
  const DrawNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DrawNumberController controller = Get.put(DrawNumberController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Draw Number"),
      ),
    );
  }
}
