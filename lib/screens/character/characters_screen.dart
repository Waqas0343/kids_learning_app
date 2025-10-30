import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kids_learning_app/routes/app_routes.dart';
import 'controllers/characters_controller.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CharactersController controller = Get.put(CharactersController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Learn Characters",
          style: Get.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red.shade700,
        centerTitle: true,
        elevation: 4.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Header with Next Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Click on Character to Learn!',
                  style: Get.textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => Get.toNamed(AppRoutes.drawCharacterScreen),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                  label: const Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 400,
            child: Obx(() {
              final characters = controller.isUppercase.value
                  ? controller.uppercaseLetters
                  : controller.lowercaseLetters;
              return GridView.builder(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  final character = characters[index];
                  return GestureDetector(
                    onTap: () {
                      controller.selectCharacter(character);
                      controller.speakCharacter(character);
                    },
                    child: Obx(() {
                      final isSelected =
                          controller.selectedCharacter.value == character;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.purple.shade400
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: isSelected
                              ? [
                            BoxShadow(
                              color: Colors.purple.shade100,
                              blurRadius: 8.0,
                              spreadRadius: 1.0,
                            )
                          ]
                              : [],
                          border: Border.all(
                            color: isSelected
                                ? Colors.purple.shade400
                                : Colors.grey.shade300,
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            character,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: isSelected
                                  ? Colors.white
                                  : Colors.red.shade700,
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                },
              );
            }),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade400,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: controller.toggleCase,
                  child: Text(
                    controller.isUppercase.value
                        ? "Show Lowercase Characters"
                        : "Show Uppercase Characters",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                );
              }),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.characterWiseObject),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Start Learning Objects",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
