import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:get/get.dart';
import 'controllers/drawing_controller.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class DrawingScreen extends StatelessWidget {
  const DrawingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DrawingScreenController controller = Get.put(DrawingScreenController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade400,
        title: const Text("Drawing Board"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () async {
              final image = await controller.saveDrawing();
              if (image != null) {
                Get.dialog(
                  AlertDialog(
                    title: const Text("Drawing Saved"),
                    content: Image.memory(image),
                    actions: [
                      TextButton(
                        onPressed: () => Get.back(),
                        child: const Text("Close"),
                      ),
                    ],
                  ),
                );
              } else {
                Get.snackbar("Error", "Could not save the drawing",
                    backgroundColor: Colors.red, colorText: Colors.white);
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: controller.clearDrawing,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.purple.shade50,
            width: Get.width,
            height: 80,
            child: Row(
              children: [
                Obx(()=> IconButton(
                    icon: Icon(Icons.color_lens_outlined, color: controller.brushColor.value),
                    onPressed: () async {
                      final color = await showDialog<Color>(
                        context: context,
                        builder: (context) => ColorPickerDialog(
                          initialColor: controller.brushColor.value,
                        ),
                      );
                      if (color != null) {
                        controller.changeBrushColor(color);
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.brush),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) => Dialog(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Brush Size"),
                          Obx(() => Slider(
                            value: controller.brushSize.value,
                            min: 1,
                            max: 20,
                            divisions: 19,
                            label: "${controller.brushSize.value.toInt()}",
                            onChanged: controller.changeBrushSize,
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_forever),
                  onPressed: controller.toggleEraser,
                ),
                IconButton(
                  icon: const Icon(Icons.undo),
                  onPressed: controller.undoDrawing,
                ),
                IconButton(
                  icon: const Icon(Icons.redo),
                  onPressed: controller.redoDrawing,
                ),
              ],
            ),
          ),
          Expanded(
            child: DrawingBoard(
              key: controller.boardKey,
              controller: controller.boardController,
              background: Container(color: Colors.white),
            ),
          ),


        ],
      ),
    );
  }
}

class ColorPickerDialog extends StatelessWidget {
  final Color initialColor;

  const ColorPickerDialog({super.key, required this.initialColor});

  @override
  Widget build(BuildContext context) {
    Color selectedColor = initialColor;

    return AlertDialog(
      title: const Text("Pick Brush Color"),
      content: SingleChildScrollView(
        child: BlockPicker(
          pickerColor: initialColor,
          onColorChanged: (color) => selectedColor = color,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(selectedColor),
          child: const Text("Select"),
        ),
      ],
    );
  }
}
