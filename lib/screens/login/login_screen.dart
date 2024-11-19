import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../app_helpers/app_spacing.dart';
import '../../app_styles/app_constant_file/app_colors.dart';
import '../../app_styles/app_constant_file/app_images.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      extendBodyBehindAppBar: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth >= 600;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: GestureDetector(
                onTap: () => Get.focusScope?.unfocus(),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: <Widget>[
                      sectionSmallSpacerVertically(),
                      Image.asset(
                        MyImages.splash,
                        height: isTablet ? 250 : 180,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Container(
                          width: isTablet ? 500 : double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8.0,
                                spreadRadius: 1.0,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: Column(
                              children: [
                                AutofillGroup(
                                  child: Form(
                                    key: controller.formKey,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 8.0),
                                          child: TextFormField(
                                            controller: controller.emailController,
                                            decoration: const InputDecoration(
                                              labelText: 'Email',
                                              border: InputBorder.none,
                                              prefixIcon: Icon(Icons.email,
                                                  color: MyColors.primaryColor),
                                            ),
                                            validator: (value) =>
                                            !RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                                .hasMatch(value!)
                                                ? "Enter a valid email"
                                                : null,
                                          ),
                                        ),
                                        const Divider(color: MyColors.lightBorderColor),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 8.0),
                                          child: Obx(
                                                () => TextFormField(
                                              controller: controller.passwordController,
                                              decoration: InputDecoration(
                                                labelText: 'Password',
                                                border: InputBorder.none,
                                                prefixIcon: const Icon(Icons.lock,
                                                    color: MyColors.primaryColor),
                                                suffixIcon: IconButton(
                                                  icon: Icon(
                                                    controller.obscureText.value
                                                        ? Icons.visibility
                                                        : Icons.visibility_off,
                                                    color: MyColors.primaryColor,
                                                  ),
                                                  onPressed: controller
                                                      .togglePasswordVisibility,
                                                ),
                                              ),
                                              validator: (text) {
                                                if (text!.isEmpty) {
                                                  return "Can't be empty";
                                                }
                                                if (text !=
                                                    controller.passwordController.text) {
                                                  return "Passwords don't match";
                                                }
                                                return null;
                                              },
                                              obscureText: controller.obscureText.value,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 12.0),
                                        ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          minLeadingWidth: 0,
                                          horizontalTitleGap: 2,
                                          leading: SizedBox(
                                            width: 32,
                                            child: Obx(
                                                  () => CheckboxListTile(
                                                value: controller.rememberMe.value,
                                                onChanged: (value) {
                                                  controller.toggleRememberMe(value);
                                                  TextInput.finishAutofillContext();
                                                },
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                            'Remember Me',
                                            style: Get.textTheme.bodyLarge?.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 60.0),
                      SizedBox(
                        height: 50,
                        width: isTablet ? 500 : double.infinity, // Adjust button width for tablet
                        child: Obx(
                              () {
                            return ElevatedButton(
                              onPressed: controller.buttonAction.value
                                  ? () {
                                TextInput.finishAutofillContext();
                                // Get.offAllNamed(AppRoutes.homeScreen);
                              }
                                  : null,
                              child: Text(
                                "Login",
                                style: Get.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.shimmerHighlightColor,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
