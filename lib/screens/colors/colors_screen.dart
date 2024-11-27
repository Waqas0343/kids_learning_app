import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import 'controllers/colors_controller.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorsController controller = Get.put(ColorsController());
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Learn Colors'),
        centerTitle: true,
        backgroundColor: Colors.purple.shade400,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Click On a Start To Learn It!',
                    style: Get.textTheme.titleSmall?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    )),
                ElevatedButton.icon(
                  onPressed: () {
                    Get.toNamed(AppRoutes.colorFillingScreen);
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
            flex: 1,
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemCount: controller.colorsList.length,
              itemBuilder: (context, index) {
                final color = controller.colorsList[index];
                return GestureDetector(
                  onTap: () {
                    controller.flutterTts.speak(color['name']);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.star,
                        color: color['color'],
                        size: 80,
                      ),
                      Center(child: Text(color['name'])),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
