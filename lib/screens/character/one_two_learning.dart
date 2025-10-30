import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kids_learning_app/app_helpers/app_spacing.dart';
import 'controllers/one_two_learning_controller.dart';

class OneTwoLearning extends StatelessWidget {
  const OneTwoLearning({super.key});

  @override
  Widget build(BuildContext context) {
    final OneTwoLearningController controller = Get.put(OneTwoLearningController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text(
          "Let's Learn Counting!",
          style: Get.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          )
        ),
        backgroundColor: Colors.purple,
        elevation: 6,
        centerTitle: true,
      ),
      body: Obx(() {
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 200,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: controller.numberWords.length,
          itemBuilder: (context, index) {
            final word = controller.numberWords[index];
            final number = index + 1;
            return GestureDetector(
              onTap: () => controller.speak(word),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  border: Border.all(color: Colors.purple.shade300, width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor:Colors.purple.shade400,
                      child: Text(
                          "$number",
                          style: Get.textTheme.titleSmall?.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                      ),
                    ),
                    otherSpacerVertically(),
                    Text(
                      word,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.purple.shade700,
                      ),
                    ),
                    otherSpacerVertically(),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.purple.shade400,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.volume_up,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
