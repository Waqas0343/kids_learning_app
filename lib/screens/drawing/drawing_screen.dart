import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:get/get.dart';
import 'controllers/drawing_controller.dart';

class DrawingScreen extends StatelessWidget {
  const DrawingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DrawingScreenController controller =
    Get.put(DrawingScreenController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Drawing Board"),
        centerTitle: true,
      ),
      body: DrawingBoard(
        key: controller.boardKey,
        alignment: Alignment.center,
        controller: controller.boardController,
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
        },

      ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () {
                  controller.saveImage();
                },
                child: const Icon(Icons.save_alt),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
