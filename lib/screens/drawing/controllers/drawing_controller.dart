import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';

class DrawingScreenController extends GetxController {
  late DrawingBoardController boardController;
  final Rx<Color> brushColor = Colors.black.obs;
  GlobalKey boardKey = GlobalKey();
  final RxDouble brushSize = 5.0.obs;
  final RxBool isEraser = false.obs;

  final List<Uint8List> undoStack = [];
  final List<Uint8List> redoStack = [];


  @override
  void onInit() {
    boardController = DrawingBoardController();
    super.onInit();
  }

  void changeBrushColor(Color color) {
    print("Changing brush color to: $color");
    brushColor.value = color;
    boardController.setStyle(
      color: color,
      strokeWidth: brushSize.value,
    );
  }

  void changeBrushSize(double size) {
    print("Changing brush size to: $size");
    brushSize.value = size;
    boardController.setStyle(
      color: brushColor.value,
      strokeWidth: size,
    );
  }


  void toggleEraser() {
    isEraser.value = !isEraser.value;
    if (isEraser.value) {
      print("Eraser Activated");
      boardController.setStyle(
        color: Colors.white,
        strokeWidth: brushSize.value,
      );
    } else {
      print("Eraser Deactivated");
      boardController.setStyle(
        color: brushColor.value,
        strokeWidth: brushSize.value,
      );
    }
  }



  void clearDrawing() {
    boardController.clear();
    undoStack.clear();
    redoStack.clear();
  }

  Future<Uint8List?> saveDrawing() async {
    return await boardController.exportAsImage();
  }

  void undoDrawing() {
    if (undoStack.isNotEmpty) {
      final lastAction = undoStack.removeLast();
      redoStack.add(lastAction);
      boardController.restoreDrawing(lastAction);
    }
  }
  void redoDrawing() {
    if (redoStack.isNotEmpty) {
      final lastUndoneAction = redoStack.removeLast();
      undoStack.add(lastUndoneAction);
      boardController.restoreDrawing(lastUndoneAction);
    }
  }

  void addToUndoStack() async {
    final currentDrawing = await boardController.exportAsImage();
    if (currentDrawing != null) {
      undoStack.add(currentDrawing);
      if (redoStack.isNotEmpty) {
        redoStack.clear();
      }
    }
  }
  // Future<Uint8List> exportAsImage() async {
  //   final boundary = boardController.key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
  //   if (boundary != null) {
  //     final image = await boundary.toImage(pixelRatio: 3.0);
  //     final byteData = await image.toByteData(format: ImageByteFormat.png);
  //     return byteData!.buffer.asUint8List();
  //   }
  //   return Uint8List(0);
  // }
}

class DrawingBoardController extends DrawingController {
  // Override the setStyle method to set the correct brush properties
  GlobalKey boardKey = GlobalKey();
  @override
  void setStyle({
    BlendMode? blendMode,
    Color? color,
    ColorFilter? colorFilter,
    FilterQuality? filterQuality,
    ImageFilter? imageFilter,
    bool? invertColors,
    bool? isAntiAlias,
    MaskFilter? maskFilter,
    Shader? shader,
    StrokeCap? strokeCap,
    StrokeJoin? strokeJoin,
    double? strokeMiterLimit,
    double? strokeWidth,
    PaintingStyle? style,
  }) {
    super.setStyle(
      color: color,
      strokeWidth: strokeWidth,
      blendMode: blendMode,
      colorFilter: colorFilter,
      filterQuality: filterQuality,
      imageFilter: imageFilter,
      invertColors: invertColors,
      isAntiAlias: isAntiAlias,
      maskFilter: maskFilter,
      shader: shader,
      strokeCap: strokeCap,
      strokeJoin: strokeJoin,
      strokeMiterLimit: strokeMiterLimit,
      style: style,
    );
  }

  // Export the current drawing as an image
  @override
  Future<Uint8List> exportAsImage() async {
    try {
      final boundary = boardKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary != null) {
        final image = await boundary.toImage(pixelRatio: 3.0);
        final byteData = await image.toByteData(format: ImageByteFormat.png);
        return byteData!.buffer.asUint8List();
      }
    } catch (e) {
      print("Error exporting image: $e");
    }
    return Uint8List(0);  // Return an empty byte array if there's an issue
  }

  // Clear the drawing area
  @override
  void clear() {
    super.clear();
  }

  // Add any additional logic for restoring drawings if needed
  void restoreDrawing(Uint8List drawingData) {
    print("Restoring drawing...");
    // Logic to restore drawing using the provided data (if needed)
  }
}


class DrawingStyle {
  final Paint paint;

  DrawingStyle({required this.paint});
}