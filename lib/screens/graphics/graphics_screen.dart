import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/graphics_controller.dart';
import 'editor_tool_bar.dart';

class GraphicsScreen extends StatelessWidget {
  const GraphicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GraphicsController controller = Get.put(GraphicsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Graphic Design & Photo Editor"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.photo),
            onPressed: controller.pickImage,
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: controller.captureImage,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
                  () => controller.selectedImage.value == null
                  ? Container(
                color: Colors.grey[200],
                child: const Center(
                  child: Text("No Image Selected"),
                ),
              )
                  : Image.file(
                controller.selectedImage.value!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
         const EditorToolbar(),
        ],
      ),
    );
  }
}

