import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_helpers/app_internet_connectivity.dart';
import '../../app_styles/app_constant_file/app_constant.dart';
import '../../app_widgets/dialogs/dialog.dart';
import '../../services/app_perferences.dart';


class LoginController extends GetxController {
  final rememberMe = false.obs;
  final RxBool buttonAction = RxBool(true);
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  var obscureText = true.obs;

  void login() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    buttonAction(false);
    if (!await Connectivity.isOnline()) {
      Connectivity.internetErrorDialog();
      buttonAction(true);
      return;
    }
    Get.dialog(const LoadingSpinner());
    // final data = {
    //   "email": emailController.text,
    //   "password": passwordController.text,
    // };

    // Get.offAllNamed(AppRoutes.homeScreen);
  }
  void toggleRememberMe(bool? value) {
    if (value != null) {
      rememberMe.value = value;
      Get.find<Preferences>().setBool(Keys.rememberMe, rememberMe.value);
    }
  }

  void saveLoginCredentials(String value) {
  }

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }
  @override
  Future<void> onInit() async {
    super.onInit();
  }
}
