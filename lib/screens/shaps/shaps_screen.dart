import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import 'controllers/shapes_controller.dart';

class ShapesScreen extends StatelessWidget {
  const ShapesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ShapesController controller = Get.put(ShapesController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Shapes"),
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
                      Get.toNamed(AppRoutes.drawShapesScreen);
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
                  itemCount: controller.shapesList.length,
                  itemBuilder: (context, index) {
                    final shape = controller.shapesList[index];
                    return GestureDetector(
                      onTap: () {
                        controller.flutterTts.speak(shape['name'] as String);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            shape['shape'] as IconData,
                            size: 80,
                            color: Colors.purple,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            shape['name'] as String,
                            style: Get.textTheme.titleSmall?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            )
                          ),
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
