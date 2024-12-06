import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import 'controllers/animal_controller.dart';

class AnimalScreen extends StatelessWidget {
  const AnimalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AnimalController controller = Get.put(AnimalController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Animals'),
        backgroundColor: Colors.purple.shade400,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Click On a Shape To Learn It!',
                      style: Get.textTheme.titleSmall?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      )),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.toNamed(AppRoutes.drawAnimalScreen);
                    },
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
            Expanded(
              child: Obx(() {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of shapes in a row
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: controller.animalsList.length,
                  itemBuilder: (context, index) {
                    final shape = controller.animalsList[index];
                    return GestureDetector(
                      onTap: () {
                        controller.selectBird(index); // Update the selected bird
                        controller.flutterTts.speak(shape['name'] as String); // Speak the name
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            shape['icon'] as String,
                            fit: BoxFit.fill,
                            width: 90,
                            height: 90,
                          ),
                          Obx(() {
                            return Text(
                              shape['name'] as String,
                              style: Get.textTheme.titleSmall?.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: controller.selectedIndex.value == index
                                    ? Colors.purple // Highlighted color
                                    : Colors.black87, // Default color
                              ),
                            );
                          }),
                        ],
                      ),
                    );
                  },

                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
