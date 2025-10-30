import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kids_learning_app/app_helpers/app_spacing.dart';
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
        backgroundColor: Colors.purple,
        centerTitle: true,
        elevation: 4.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                    backgroundColor: Colors.purple,
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
          Obx(() {
            final characters = controller.isUppercase.value
                ? controller.uppercaseLetters
                : controller.lowercaseLetters;
            return GridView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
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
                        color:
                            isSelected ? Colors.purple.shade400 : Colors.white,
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
                            color:
                                isSelected ? Colors.white : Colors.red.shade700,
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            );
          }),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.red.shade400,
                      Colors.purple.shade400,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/2_das.jpg',
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    widgetSpacerVertically(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(() {
                          return AnimatedScale(
                            duration: const Duration(milliseconds: 150),
                            scale: controller.isUppercase.value ? 1.0 : 1.05,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.indigoAccent,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                elevation: 4,
                              ),
                              onPressed: controller.toggleCase,
                              child: Text(
                                controller.isUppercase.value
                                    ? "Show Lowercase (a)"
                                    : "Show Uppercase (A)",
                                style: Get.textTheme.titleSmall?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                )
                              ),
                            ),
                          );
                        }),
                        otherSpacerHorizontally(),
                        AnimatedScale(
                          duration: const Duration(milliseconds: 150),
                          scale: 1.0,
                          child: ElevatedButton(
                            onPressed: () => Get.toNamed(AppRoutes.characterWiseObject),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber.shade600,
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 4,
                            ),
                            child: Text("Start Learning Objects",
                                style: Get.textTheme.titleSmall?.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                    widgetSpacerVertically(),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.oneTwoLearning);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade600,
                        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        shadowColor: Colors.orangeAccent,
                        elevation: 6,
                      ),
                      child:  Text("Learn One Two",
                          style: Get.textTheme.titleSmall?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
