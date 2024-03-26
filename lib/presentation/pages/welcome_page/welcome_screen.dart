import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_text_component.dart';
import 'package:task_management/components/richtext_component.dart';
import 'package:task_management/routes/app_routes.dart';
import 'package:task_management/utils/styles.dart';

import '../../../components/custom_button_component.dart';
import '../../../components/main_scaffold_component.dart';
import 'controller/welcome_controller.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<WelcomeController>(
        init: WelcomeController(),
        // initState: (v) {
        //   // WidgetsBinding.instance.addPostFrameCallback((_) {});
        // },
        builder: (_) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 47),
              color: Styles.black,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: Image.asset(
                        "assets/images/common/board1.png",
                        height: 300,
                        width: 300,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const CustomTextWidget(
                      text: "Find interesting project and submit proposals.",
                      color: Styles.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomTextWidget(
                      text: "Chat, share files, and complete projects.",
                      color: Styles.white,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 84,
                    ),
                    CustomButton(
                      title: "Login",
                      fontColor: Styles.black,
                      bgColor: Styles.orangeYellow,
                      fontSize: 16,
                      onTap: () {
                        Get.toNamed(Routes.signin);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichTextWidget(
                      text: "Don't have account ?",
                      onTapText: " Sign Up",
                      color: Styles.white,
                      onTapColor: Styles.orangeYellow,
                      onTap: () {
                        Get.toNamed(Routes.signup);
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
