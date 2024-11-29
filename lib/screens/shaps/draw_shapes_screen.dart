import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:get/get.dart';

import '../../app_helpers/app_spacing.dart';
import 'controllers/draw_shapes_controller.dart';

class DrawShapesScreen extends StatelessWidget {
  const DrawShapesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DrawShapesController controller = Get.put(DrawShapesController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Draw Shapes"),
        backgroundColor: Colors.purple.shade400,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widgetSpacerVertically(),
            Text(
              'Draw this Shapes',
              style: Get.textTheme.titleMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            widgetSpacerVertically(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.volume_up,
                    size: 40,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    controller.speakNumber(controller.selectedShape.value['name']);
                  },
                ),
                widgetSpacerHorizontally(),
                Obx(() {
                  final selectedShape = controller.selectedShape.value;
                  if (selectedShape.isEmpty) {
                    return Text(
                      "No shape selected yet!",
                      style: Get.textTheme.titleSmall?.copyWith(
                          fontSize: 20, color: Colors.grey
                      ),
                    );
                  }
                  return Column(
                    children: [
                      Icon(
                        selectedShape['shape'],
                        size: 60,
                        color: Colors.purple,
                      ),
                    ],
                  );
                }),
              ],
            ),
            widgetSpacerVertically(),
            Obx(() => Text(
              'Match: ${controller.matchPercentage.value.toStringAsFixed(1)}%',
              style: Get.textTheme.titleSmall?.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            ),

            widgetSpacerVertically(),
            Expanded(
              child: RepaintBoundary(
                key: controller.repaintKey,
                child: DrawingBoard(
                  alignment: Alignment.center,
                  background: Container(
                    color: Colors.white,
                  ),
                  showDefaultActions: true,
                  showDefaultTools: true,
                  clipBehavior: Clip.antiAlias,
                  boardClipBehavior: Clip.hardEdge,
                  panAxis: PanAxis.free,
                  boardConstrained: true,
                  boardScaleEnabled: true,
                  boardPanEnabled: true,
                  maxScale: 5.0,
                  minScale: 0.5,
                  onPointerDown: (PointerDownEvent event) {
                    debugPrint('Pointer Down at: ${event.position}');
                  },
                  onPointerMove: (PointerMoveEvent event) {
                    debugPrint('Pointer Moved at: ${event.position}');
                  },
                  onPointerUp: (PointerUpEvent event) {
                    debugPrint('Pointer Up at: ${event.position}');
                    // controller.captureImage(controller.repaintKey);
                  },
                ),
              ),
            ),
            widgetSpacerVertically(),
          ],
        ),
      ),
    );
  }
}
