import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/colors_controller.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorsController controller = Get.put(ColorsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Colors'),
        backgroundColor: Colors.purple.shade400,
      ),
    );
  }
}
