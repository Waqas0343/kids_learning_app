import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/numbers_controller.dart';

class NumbersScreen extends StatelessWidget {
  const NumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NumbersController controller = Get.put(NumbersController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Numbers'),
        backgroundColor: Colors.purple.shade400,
      ),
    );
  }
}
