import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_learning_app/screens/splash/splash_controller.dart';
import '../../app_styles/app_constant_file/app_colors.dart';
import '../../app_styles/app_constant_file/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              MyImages.splash,
              fit: BoxFit.cover,
              height: Get.height,
              alignment: Alignment.center,
            ),
          ),
          // SafeArea for Content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome To",
                      style: Get.textTheme.titleSmall?.copyWith(fontSize: 20),
                    ),
                    // App Title
                    Text(
                      "Kids Learning",
                      style: GoogleFonts.abrilFatface(
                        textStyle: const TextStyle(
                          color: MyColors.greenLight,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Connectivity Error UI
                    if (controller.connectivityError.value)
                      Column(
                        children: [
                          const Icon(
                            Icons.signal_wifi_off_outlined,
                            size: 60,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            "Internet Not available.",
                            style: Get.textTheme.headlineSmall?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 32.0),
                          ElevatedButton(
                            onPressed: () => controller.checkLogin(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 32.0,
                              ),
                            ),
                            child: const Text(
                              "Retry",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
