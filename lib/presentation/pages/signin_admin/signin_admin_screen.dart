import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/main_scaffold_component.dart';

import '../../../components/custom_appbar_component.dart';
import '../../../components/custom_button_component.dart';
import '../../../components/custom_text_component.dart';
import '../../../components/custom_textfield_component.dart';
import '../../../utils/styles.dart';
import '../../../utils/validator.dart';
import 'controller/signin_admin_controller.dart';

class SignInAdminScreen extends GetView<SigninAdminController> {
  const SignInAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SigninAdminController());

    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: GetBuilder<SigninAdminController>(
          init: SigninAdminController(),
          builder: (_) {
            return MainScaffold(
              backgroundColor: Styles.black,
              appBar: CustomAppBar(
                bgColor: Styles.black,
                backButtonColor: Colors.black,
                // leading: true,
                titleWidget: Image.asset(
                  "assets/images/logos/logo1.png",
                  height: 44,
                ),
              ),
              body: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: Container(
                  color: Colors.transparent,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Styles.screenPadding),
                          child: Form(
                            key: controller.signinFormKey,
                            child: Column(
                              // mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,

                              children: [
                                const SizedBox(height: 65),
                                const CustomTextWidget(
                                  text: "Log in to SmartWay",
                                  fontSize: 24,
                                  color: Styles.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(height: 20),

                                CustomTextField(
                                  textFieldColor: controller.focusEmail.hasFocus
                                      ? Styles.black
                                      : Styles.white,
                                  maxLines: 1,
                                  fillColor: controller.focusEmail.hasFocus
                                      ? Styles.white
                                      : Styles.greyLight.withOpacity(0.10),
                                  focusColor: controller.focusEmail.hasFocus
                                      ? Styles.orangeYellow
                                      : Styles.white,
                                  hint: "Username or Email",
                                  hintFontSize: 16,
                                  hintColor: Styles.solidGrey,
                                  textInputType: TextInputType.emailAddress,
                                  txtController:
                                      controller.emailTextEditingController,
                                  validatorFtn: Validators.emailValidator,
                                  textInputAction: TextInputAction.next,
                                  node: controller.focusEmail,
                                  onTap: () {},
                                  padding: 17,
                                  prefixIcon: Image.asset(
                                    "assets/images/icons/email_icon.png",
                                    height: 8,
                                    color: Styles.solidGrey,
                                    width: 8,
                                  ),
                                  borderRadius: 9,
                                ),
                                const SizedBox(height: 20),
                                CustomTextField(
                                  textFieldColor:
                                      controller.focusPassword.hasFocus
                                          ? Styles.black
                                          : Styles.white,
                                  obscure: controller.obsecurePass,
                                  onTapPass: () {
                                    controller.setObsecure();
                                  },
                                  maxLines: 1,
                                  hintFontSize: 16,
                                  fillColor: controller.focusPassword.hasFocus
                                      ? Styles.white
                                      : Styles.greyLight.withOpacity(0.10),
                                  focusColor: controller.focusPassword.hasFocus
                                      ? Styles.orangeYellow
                                      : Styles.white,
                                  hint: "Password",
                                  hintColor: Styles.solidGrey,
                                  textInputType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  node: controller.focusPassword,
                                  txtController:
                                      controller.passwordTextEditingController,
                                  prefixIcon: Image.asset(
                                    "assets/images/icons/password_icon.png",
                                    height: 8,
                                    color: Styles.solidGrey,
                                    width: 8,
                                  ),
                                  validatorFtn: (value) {
                                    if (value == "") {
                                      return "Password cannot be empty";
                                    } else if (value.length < 6) {
                                      return "Password must be greater than 6 characters";
                                    }
                                    return null;
                                  },
                                  isPass: controller.getPasswordVisiblity(),
                                  borderRadius: 9,
                                ),
                                const SizedBox(height: 27),
                                // SizedBox(
                                //   width: Get.width,
                                //   child: GestureDetector(
                                //     behavior: HitTestBehavior.opaque,
                                //     onTap: () {
                                //       controller.setRememberVisiblity(
                                //           !controller.rememberMe);
                                //       if (kDebugMode) {
                                //         print(controller.rememberMe);
                                //       }
                                //     },
                                //     child: Row(
                                //       children: [
                                //         Row(
                                //           children: [
                                //             Radio(
                                //                 value: controller
                                //                     .getRememberVisiblity(),
                                //                 groupValue: controller
                                //                     .getRememberVisiblity(),
                                //                 onChanged: (value) {}),
                                //             const SizedBox(
                                //               width: 10,
                                //             ),
                                //             const CustomTextWidget(
                                //               text: "Remember me",
                                //               fontSize: 13,
                                //               fontWeight: FontWeight.w600,
                                //               color: Styles.greyLight2,
                                //             ),
                                //           ],
                                //         ),
                                //         const Spacer(),
                                //         GestureDetector(
                                //           onTap: () {
                                //             Get.toNamed(Routes.forgotPassword);
                                //             // Navigator.pushNamed(
                                //             //     context, Routes.forgotPassword);
                                //           },
                                //           child: const CustomTextWidget(
                                //             text: "Forgot Password?",
                                //             fontSize: 13,
                                //             fontWeight: FontWeight.w600,
                                //             color: Styles.redNormal,
                                //           ),
                                //         )
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                const SizedBox(height: 38),

                                CustomButton(
                                  title: "Login",
                                  bgColor: Styles.orangeYellow,
                                  fontColor: Styles.black,
                                  fontSize: 16,
                                  onTap: () {
                                    if (controller.signinFormKey.currentState!
                                        .validate()) {
                                      controller.signIn(
                                          email: controller
                                              .emailTextEditingController.text,
                                          password: controller
                                              .passwordTextEditingController
                                              .text);
                                    }

                                    // Get.toNamed(Routes.createProfile);
                                  },
                                ),
                                const SizedBox(height: 19),
                                // const CustomTextWidget(
                                //   text: "Forget Password?",
                                //   color: Styles.orangeYellow,
                                //   fontSize: 12,
                                // ),
                                const SizedBox(height: 23),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
