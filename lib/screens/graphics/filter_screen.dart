import 'package:flutter/material.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_editor_plus/options.dart';

class ImageEditorScreen extends StatelessWidget {
  final String imagePath;

  const ImageEditorScreen({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Image"),
        backgroundColor: Colors.blue,
      ),
      body: ImageEditor(
        image: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: 400,
          height: 400,
          filterQuality: FilterQuality.high,
        ),
        cropOption: const CropOption(),
        filtersOption: const FiltersOption(),
        blurOption: const BlurOption(),
        brushOption: const BrushOption(),
        textOption: const TextOption(),
      ),
    );
  }
}
