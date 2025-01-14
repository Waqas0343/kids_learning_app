import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:get/get.dart';
import 'package:kids_learning_app/app_helpers/app_spacing.dart';
import 'package:kids_learning_app/app_widgets/app_debug_widget/app_debug_pointer.dart';
import 'controllers/draw_character_controller.dart';

class DrawCharacterScreen extends StatelessWidget {
  const DrawCharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CharacterController controller = Get.put(CharacterController());

    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Learn Characters',
          style: Get.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white,),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 6,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widgetSpacerVertically(),
            Text(
              'Draw this Character and Speak',
              style: Get.textTheme.titleMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            widgetSpacerVertically(),
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.volume_up,
                    size: 40,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    controller.speakCharacter(controller.currentCharacter.value);
                  },
                ),
                widgetSpacerHorizontally(),
                Text(
                  controller.currentCharacter.value,
                  style: Get.textTheme.titleSmall?.copyWith(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            ),
            widgetSpacerVertically(),
            Obx(() => Text(
              'Match: ${controller.matchValuePercentage.value.toStringAsFixed(1)}%',
              style: Get.textTheme.titleSmall?.copyWith(
                fontSize: 24,
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
                  minScale: 0.9,

                  onPointerDown: (PointerDownEvent event) {
                    Debug.log('Pointer Down at: ${event.position}');
                  },
                  onPointerMove: (PointerMoveEvent event) {
                    Debug.log('Pointer Moved at: ${event.position}');
                  },
                  onPointerUp: (PointerUpEvent event) {
                    Debug.log('Pointer Up at: ${event.position}');
                    controller.captureImage();
                  },
                ),
              ),
            ),
            widgetSpacerVertically(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 55,
                      child: ElevatedButton(
                        onPressed: (){
                          controller.clearCanvas();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade600,
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          elevation: 6,
                        ),
                        child: Text(
                          'Clear',
                          style: Get.textTheme.titleSmall?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  widgetSpacerHorizontally(),
                  Expanded(
                    child: SizedBox(
                      height: 55,
                      child: ElevatedButton(
                        onPressed: controller.captureAndDetectText,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          elevation: 6,
                        ),
                        child: Text(
                          'Detect',
                          style: Get.textTheme.titleSmall?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
