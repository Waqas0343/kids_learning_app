import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kids_learning_app/screens/colors/random_shape.dart';
import 'controllers/color_filling_controller.dart';

class ColorFillingScreen extends StatelessWidget {
  const ColorFillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorFillingController controller = Get.put(ColorFillingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Activity'),
        backgroundColor: Colors.purple.shade400,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: Obx(() {
              return Center(
                child: CustomPaint(
                  size: const Size(150, 150),
                  painter: RandomShapePainter(
                    fillColor: controller.currentFillColor.value,
                    borderColor: controller.targetBorderColor,
                  ),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.volume_up,
                    size: 40,
                    color: Colors.purple,
                  ),
                  onPressed: () {
                    controller.speakNumber('Fill the Color In Shape With Matching Border Color');
                  },
                ),
                Text(
                  'Pick The Correct Color To Fill',
                  style: Get.textTheme.titleSmall?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: GetBuilder<ColorFillingController>(
              builder: (_) {
                return GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: controller.colorsList.length,
                  itemBuilder: (context, index) {
                    final color = controller.colorsList[index];
                    return GestureDetector(
                      onTap: () {
                        controller.checkAndFillColor(
                          color['name'],
                          color['color'],
                        );
                      },
                      child: Icon(
                        Icons.star,
                        color: color['color'],
                        size: 80,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
