
import 'package:flutter/services.dart';

class MyImages{
  static const splash = "assets/images/splash.jpg";
  static const first = "assets/images/first.png";
  static const google = "assets/images/google.png";
  static const ambulance = "assets/images/ambulance.jpg";

  static Future<Uint8List> getImageBytes(String imagePath) async {
    final ByteData data = await rootBundle.load(imagePath);
    return data.buffer.asUint8List();
  }
}