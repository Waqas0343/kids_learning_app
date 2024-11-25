import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/graphics_controller.dart';

class EditorToolbar extends StatelessWidget {
  const EditorToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    final GraphicsController controller = Get.find();

    return Container(
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.text_fields),
            color: Colors.white,
            onPressed: () => controller.selectedTool.value = 'text',
          ),
          IconButton(
            icon: const Icon(Icons.color_lens),
            color: Colors.white,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Pick a Color"),
                  content: SingleChildScrollView(
                    child: Column(
                      children: Colors.primaries.map((color) {
                        return GestureDetector(
                          onTap: () {
                            controller.selectedColor.value = color;
                            Get.back();
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            width: 40,
                            height: 40,
                            color: color,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
