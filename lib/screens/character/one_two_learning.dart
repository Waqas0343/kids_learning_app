import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/one_two_learning_controller.dart';

class OneTwoLearning extends StatelessWidget {
  const OneTwoLearning({super.key});

  @override
  Widget build(BuildContext context) {
    final OneTwoLearningController controller = Get.put(OneTwoLearningController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learning Counting "),
      ),
    );
  }
}
