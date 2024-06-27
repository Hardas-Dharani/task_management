import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/richtext_component.dart';

import '../../../components/custom_appbar_component.dart';
import '../../../components/custom_button_component.dart';
import '../../../components/custom_text_component.dart';
import '../../../components/custom_textfield_component.dart';
import '../../../components/main_scaffold_component.dart';
import '../../../utils/styles.dart';
import '../../../utils/validator.dart';
import 'controller/signup_controller.dart';

class SignUpScreen extends GetView<SignupController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      init: SignupController(),
      initState: (v) {
        // controller.selectedCountryCode = Get.arguments["selectedCountryCode"];
      },
      builder: (_) {
        // final selectedCountryInfo = controller.selectedCountryInfo;
        return MainScaffold(
          backgroundColor: Styles.black,
          appBar: CustomAppBar(
            bgColor: Styles.black,
            leading: true,
            backButtonColor: Colors.white,
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
                        key: controller.signupFormKey,
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            const SizedBox(height: 65),
                            const CustomTextWidget(
                              text: "Sign Up to SmartWay",
                              fontSize: 24,
                              color: Styles.white,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(height: 20),
                            // Center(
                            //   child: badges.Badge(
                            //     position:
                            //         badges.BadgePosition.topEnd(top: 0, end: 0),
                            //     badgeContent: GestureDetector(
                            //         behavior: HitTestBehavior.opaque,
                            //         onTap: () {
                            //           Get.dialog(
                            //             AlertDialog(
                            //               title: const Text('Select an Image'),
                            //               content: Column(
                            //                 mainAxisSize: MainAxisSize.min,
                            //                 children: [
                            //                   GestureDetector(
                            //                     onTap: () {
                            //                       Get.back();
                            //                       controller.galleryPick();
                            //                     },
                            //                     child: Container(
                            //                       color: Colors.transparent,
                            //                       child: Row(
                            //                         children: [
                            //                           const Icon(
                            //                             Icons.photo,
                            //                             size: 20,
                            //                           ),
                            //                           const SizedBox(
                            //                             width: 20,
                            //                           ),
                            //                           TextButton(
                            //                             onPressed: () {
                            //                               Get.back();
                            //                               controller
                            //                                   .galleryPick();
                            //                             },
                            //                             child: const Text(
                            //                               'Gallery',
                            //                               style: TextStyle(
                            //                                 color: Colors.black,
                            //                               ),
                            //                             ),
                            //                           ),
                            //                         ],
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   GestureDetector(
                            //                     onTap: () {
                            //                       print("dsfasdafasdfsa");
                            //                       Get.back();
                            //                       // Navigator.of(context).pop();
                            //                       controller.camPick();
                            //                     },
                            //                     child: Container(
                            //                       width: Get.width,
                            //                       color: Colors.transparent,
                            //                       child: Row(
                            //                         children: [
                            //                           const Icon(
                            //                             Icons.camera_alt,
                            //                             size: 20,
                            //                           ),
                            //                           const SizedBox(
                            //                             width: 20,
                            //                           ),
                            //                           TextButton(
                            //                             onPressed: () {
                            //                               Get.back();
                            //                               controller.camPick();
                            //                             },
                            //                             child: const Text(
                            //                               'Camera',
                            //                               style: TextStyle(
                            //                                 color: Colors.black,
                            //                               ),
                            //                             ),
                            //                           ),
                            //                         ],
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //               // actions: [
                            //             ),
                            //           );
                            //         },
                            //         child: const Icon(
                            //           Icons.edit,
                            //           size: 14,
                            //         )),
                            //     child: CircleAvatar(
                            //       radius: 50,
                            //       backgroundImage:
                            //           controller.selectedFile != null
                            //               ? AssetImage(controller.selectedFile!)
                            //               : null,
                            //     ),
                            //   ),
                            // ),

                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    bgColor: Styles.black,
                                    onTap: () {
                                      controller.buttonClicked = true;
                                      controller.update();
                                    },
                                    title: "Student",
                                    fontColor: Styles.white,
                                    radius: 8,
                                    borderColor: !controller.buttonClicked
                                        ? Styles.orangeYellow.withOpacity(0.3)
                                        : Styles.orangeYellow,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: CustomButton(
                                    radius: 8,
                                    onTap: () {
                                      controller.buttonClicked = false;
                                      controller.update();
                                    },
                                    bgColor: Styles.black,
                                    fontColor: Styles.white,
                                    title: "Teacher",
                                    borderColor: controller.buttonClicked
                                        ? Styles.orangeYellow.withOpacity(0.3)
                                        : Styles.orangeYellow,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 33),
                            controller.buttonClicked
                                ? Column(
                                    children: [
                                      // CustomTextField(
                                      //   textFieldColor: Styles.white,
                                      //   maxLines: 1,
                                      //   fillColor: controller.focusName.hasFocus
                                      //       ? Styles.black
                                      //       : Styles.greyLight
                                      //           .withOpacity(0.10),
                                      //   focusColor:
                                      //       controller.focusName.hasFocus
                                      //           ? Styles.primaryColor
                                      //           : Styles.white,
                                      //   hint: "Full Name",
                                      //   hintFontSize: 16,
                                      //   hintColor: Styles.solidGrey,
                                      //   validatorFtn: (value) {
                                      //     if (value == "") {
                                      //       return "Full Name cannot be empty";
                                      //     }
                                      //     return null;
                                      //   },
                                      //   txtController: controller
                                      //       .nameTextEditingController,
                                      //   textInputAction: TextInputAction.done,
                                      //   node: controller.focusName,
                                      //   onTap: () {},
                                      //   padding: 17,
                                      //   borderRadius: 9,
                                      // ),
                                      // const SizedBox(height: 20),
                                      CustomTextField(
                                        textFieldColor: Styles.white,
                                        maxLines: 1,
                                        fillColor:
                                            controller.focusLanguage.hasFocus
                                                ? Styles.black
                                                : Styles.greyLight
                                                    .withOpacity(0.10),
                                        focusColor:
                                            controller.focusLanguage.hasFocus
                                                ? Styles.primaryColor
                                                : Styles.white,
                                        hint: "User Name",
                                        hintFontSize: 16,
                                        hintColor: Styles.solidGrey,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        txtController: controller
                                            .userNameTextEditingController,
                                        validatorFtn: (value) {
                                          if (value == "") {
                                            return "User Name cannot be empty";
                                          }
                                          return null;
                                        },
                                        textInputAction: TextInputAction.done,
                                        node: controller.focusLanguage,
                                        onTap: () {},
                                        padding: 17,
                                        borderRadius: 9,
                                      ),
                                      const SizedBox(height: 20),
                                      CustomTextField(
                                        textFieldColor: Styles.white,
                                        maxLines: 1,
                                        fillColor:
                                            controller.focusEmail.hasFocus
                                                ? Styles.black
                                                : Styles.greyLight
                                                    .withOpacity(0.10),
                                        focusColor:
                                            controller.focusEmail.hasFocus
                                                ? Styles.primaryColor
                                                : Styles.white,
                                        hint: "Email",
                                        hintFontSize: 16,
                                        hintColor: Styles.solidGrey,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        txtController: controller
                                            .emailTextEditingController,
                                        validatorFtn: Validators.emailValidator,
                                        textInputAction: TextInputAction.done,
                                        node: controller.focusEmail,
                                        onTap: () {},
                                        padding: 17,
                                        borderRadius: 9,
                                      ),
                                      const SizedBox(height: 20),
                                      CustomTextField(
                                        textFieldColor: Styles.white,
                                        obscure: controller.obsecurePass,
                                        onTapPass: () {
                                          controller.setObsecure();
                                        },
                                        maxLines: 1,
                                        hintFontSize: 16,
                                        fillColor:
                                            controller.focusPassword.hasFocus
                                                ? Styles.black
                                                : Styles.greyLight
                                                    .withOpacity(0.10),
                                        focusColor:
                                            controller.focusPassword.hasFocus
                                                ? Styles.primaryColor
                                                : Styles.white,
                                        hint: "Password",
                                        hintColor: Styles.solidGrey,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        textInputAction: TextInputAction.done,
                                        node: controller.focusPassword,
                                        txtController: controller
                                            .passwordTextEditingController,
                                        validatorFtn: (value) {
                                          if (value == "") {
                                            return "Password cannot be empty";
                                          } else if (value.length < 6) {
                                            return "Password must be greater than 6 characters";
                                          }
                                          return null;
                                        },
                                        isPass:
                                            controller.getPasswordVisiblity(),
                                        borderRadius: 9,
                                      ),
                                      const SizedBox(height: 20),
                                      // CustomTextField(
                                      //   textFieldColor: Styles.white,
                                      //   maxLines: 1,
                                      //   hintFontSize: 16,
                                      //   fillColor:
                                      //       controller.focusNumber.hasFocus
                                      //           ? Styles.black
                                      //           : Styles.greyLight
                                      //               .withOpacity(0.10),
                                      //   focusColor:
                                      //       controller.focusNumber.hasFocus
                                      //           ? Styles.primaryColor
                                      //           : Styles.white,
                                      //   hint: "Phone Number",
                                      //   textInputType: TextInputType.number,
                                      //   hintColor: Styles.solidGrey,
                                      //   textInputAction: TextInputAction.done,
                                      //   node: controller.focusNumber,
                                      //   txtController: controller
                                      //       .phoneTextEditingController,
                                      //   validatorFtn: (value) {
                                      //     if (value == "") {
                                      //       return "Phone cannot be empty";
                                      //     }
                                      //     return null;
                                      //   },
                                      //   isPass:
                                      //       controller.getPasswordVisiblity(),
                                      //   borderRadius: 9,
                                      // ),
                                      // const SizedBox(height: 20),
                                      controller.country.data == null
                                          ? const SizedBox()
                                          : Container(
                                              decoration: BoxDecoration(
                                                  color: Styles.greyLight
                                                      .withOpacity(0.10),
                                                  borderRadius:
                                                      BorderRadius.circular(9)),
                                              child: DropdownButtonFormField(
                                                  dropdownColor: Styles.black,
                                                  decoration: InputDecoration(
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(9),
                                                        borderSide: BorderSide(
                                                          width: 0.5,
                                                          color: Styles
                                                              .greyLight
                                                              .withOpacity(
                                                                  0.18),
                                                          style:
                                                              BorderStyle.none,
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(9),
                                                        borderSide: BorderSide(
                                                            width: 0.5,
                                                            color: Styles
                                                                .greyLight
                                                                .withOpacity(
                                                                    0.18)),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(9),
                                                        borderSide: BorderSide(
                                                            width: 0.5,
                                                            color: Styles
                                                                .greyLight
                                                                .withOpacity(
                                                                    0.18)),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(9),
                                                        borderSide: BorderSide(
                                                            width: 0.5,
                                                            color: Styles
                                                                .greyLight
                                                                .withOpacity(
                                                                    0.18)),
                                                      ),
                                                      disabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(9),
                                                        borderSide: BorderSide(
                                                          width: 0.5,
                                                          color: Styles
                                                              .greyLight
                                                              .withOpacity(
                                                                  0.18),
                                                          style:
                                                              BorderStyle.none,
                                                        ),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(9),
                                                        borderSide: BorderSide(
                                                          width: 0.5,
                                                          color: Styles
                                                              .greyLight
                                                              .withOpacity(
                                                                  0.18),
                                                        ),
                                                      ),
                                                      fillColor: Styles
                                                          .greyLight
                                                          .withOpacity(0.10)),
                                                  value: controller
                                                      .countryModelData,
                                                  items:
                                                      controller.country.data!
                                                          .map((e) =>
                                                              DropdownMenuItem(
                                                                value: e,
                                                                child: CustomTextWidget(
                                                                    color: Styles
                                                                        .white,
                                                                    text:
                                                                        e.name ??
                                                                            ""),
                                                              ))
                                                          .toList(),
                                                  onChanged:
                                                      (contryModelsData) {}),
                                            ),
                                      const SizedBox(height: 20),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      // CustomTextField(
                                      //   textFieldColor: Styles.white,
                                      //   maxLines: 1,
                                      //   fillColor: controller.focusName.hasFocus
                                      //       ? Styles.black
                                      //       : Styles.greyLight
                                      //           .withOpacity(0.10),
                                      //   focusColor:
                                      //       controller.focusName.hasFocus
                                      //           ? Styles.primaryColor
                                      //           : Styles.white,
                                      //   hint: "Full Name",
                                      //   hintFontSize: 16,
                                      //   hintColor: Styles.solidGrey,
                                      //   validatorFtn: (value) {
                                      //     if (value == "") {
                                      //       return "Full Name cannot be empty";
                                      //     }
                                      //     return null;
                                      //   },
                                      //   txtController: controller
                                      //       .nameTextEditingController,
                                      //   textInputAction: TextInputAction.done,
                                      //   node: controller.focusName,
                                      //   onTap: () {},
                                      //   padding: 17,
                                      //   borderRadius: 9,
                                      // ),
                                      // const SizedBox(height: 20),
                                      CustomTextField(
                                        textFieldColor: Styles.white,
                                        maxLines: 1,
                                        fillColor:
                                            controller.focusLanguage.hasFocus
                                                ? Styles.black
                                                : Styles.greyLight
                                                    .withOpacity(0.10),
                                        focusColor:
                                            controller.focusLanguage.hasFocus
                                                ? Styles.primaryColor
                                                : Styles.white,
                                        hint: "User Name",
                                        hintFontSize: 16,
                                        hintColor: Styles.solidGrey,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        txtController: controller
                                            .userNameTextEditingController,
                                        validatorFtn: (value) {
                                          if (value == "") {
                                            return "User Name cannot be empty";
                                          }
                                          return null;
                                        },
                                        textInputAction: TextInputAction.done,
                                        node: controller.focusLanguage,
                                        onTap: () {},
                                        padding: 17,
                                        borderRadius: 9,
                                      ),
                                      const SizedBox(height: 20),
                                      CustomTextField(
                                        textFieldColor: Styles.white,
                                        maxLines: 1,
                                        fillColor:
                                            controller.focusEmail.hasFocus
                                                ? Styles.black
                                                : Styles.greyLight
                                                    .withOpacity(0.10),
                                        focusColor:
                                            controller.focusEmail.hasFocus
                                                ? Styles.primaryColor
                                                : Styles.white,
                                        hint: "Email",
                                        hintFontSize: 16,
                                        hintColor: Styles.solidGrey,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        txtController: controller
                                            .emailTextEditingController,
                                        validatorFtn: Validators.emailValidator,
                                        textInputAction: TextInputAction.done,
                                        node: controller.focusEmail,
                                        onTap: () {},
                                        padding: 17,
                                        borderRadius: 9,
                                      ),
                                      const SizedBox(height: 20),
                                      CustomTextField(
                                        textFieldColor: Styles.white,
                                        obscure: controller.obsecurePass,
                                        onTapPass: () {
                                          controller.setObsecure();
                                        },
                                        maxLines: 1,
                                        hintFontSize: 16,
                                        fillColor:
                                            controller.focusPassword.hasFocus
                                                ? Styles.black
                                                : Styles.greyLight
                                                    .withOpacity(0.10),
                                        focusColor:
                                            controller.focusPassword.hasFocus
                                                ? Styles.primaryColor
                                                : Styles.white,
                                        hint: "Password",
                                        hintColor: Styles.solidGrey,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        textInputAction: TextInputAction.done,
                                        node: controller.focusPassword,
                                        txtController: controller
                                            .passwordTextEditingController,
                                        validatorFtn: (value) {
                                          if (value == "") {
                                            return "Password cannot be empty";
                                          } else if (value.length < 6) {
                                            return "Password must be greater than 6 characters";
                                          }
                                          return null;
                                        },
                                        isPass:
                                            controller.getPasswordVisiblity(),
                                        borderRadius: 9,
                                      ),
                                      const SizedBox(height: 20),
                                      // CustomTextField(
                                      //   textFieldColor: Styles.white,
                                      //   maxLines: 1,
                                      //   hintFontSize: 16,
                                      //   fillColor:
                                      //       controller.focusNumber.hasFocus
                                      //           ? Styles.black
                                      //           : Styles.greyLight
                                      //               .withOpacity(0.10),
                                      //   focusColor:
                                      //       controller.focusNumber.hasFocus
                                      //           ? Styles.primaryColor
                                      //           : Styles.white,
                                      //   hint: "Phone Number",
                                      //   textInputType: TextInputType.number,
                                      //   hintColor: Styles.solidGrey,
                                      //   textInputAction: TextInputAction.done,
                                      //   node: controller.focusNumber,
                                      //   txtController: controller
                                      //       .phoneTextEditingController,
                                      //   validatorFtn: (value) {
                                      //     if (value == "") {
                                      //       return "Phone cannot be empty";
                                      //     }
                                      //     return null;
                                      //   },
                                      //   isPass:
                                      //       controller.getPasswordVisiblity(),
                                      //   borderRadius: 9,
                                      // ),
                                      // const SizedBox(height: 20),
                                      // controller.country.data == null
                                      //     ? const SizedBox()
                                      //     : Container(
                                      //         decoration: BoxDecoration(
                                      //             color: Styles.greyLight
                                      //                 .withOpacity(0.18),
                                      //             borderRadius:
                                      //                 BorderRadius.circular(9)),
                                      //         child: DropdownButtonFormField(
                                      //             dropdownColor: Styles.black,
                                      //             // focusColor: Styles.greyLight
                                      //             //     .withOpacity(0.18),
                                      //             decoration: InputDecoration(
                                      //                 hoverColor: Styles
                                      //                     .greyLight
                                      //                     .withOpacity(0.18),
                                      //                 focusColor: Styles
                                      //                     .greyLight
                                      //                     .withOpacity(0.18),
                                      //                 enabledBorder:
                                      //                     OutlineInputBorder(
                                      //                   borderRadius:
                                      //                       BorderRadius
                                      //                           .circular(9),
                                      //                   borderSide: BorderSide(
                                      //                     width: 0.5,
                                      //                     color: Styles
                                      //                         .greyLight
                                      //                         .withOpacity(
                                      //                             0.18),
                                      //                     style:
                                      //                         BorderStyle.none,
                                      //                   ),
                                      //                 ),
                                      //                 focusedBorder:
                                      //                     OutlineInputBorder(
                                      //                   borderRadius:
                                      //                       BorderRadius
                                      //                           .circular(9),
                                      //                   borderSide: BorderSide(
                                      //                       width: 0.5,
                                      //                       color: Styles
                                      //                           .greyLight
                                      //                           .withOpacity(
                                      //                               0.18)),
                                      //                 ),
                                      //                 errorBorder:
                                      //                     OutlineInputBorder(
                                      //                   borderRadius:
                                      //                       BorderRadius
                                      //                           .circular(9),
                                      //                   borderSide: BorderSide(
                                      //                       width: 0.5,
                                      //                       color: Styles
                                      //                           .greyLight
                                      //                           .withOpacity(
                                      //                               0.18)),
                                      //                 ),
                                      //                 focusedErrorBorder:
                                      //                     OutlineInputBorder(
                                      //                   borderRadius:
                                      //                       BorderRadius
                                      //                           .circular(9),
                                      //                   borderSide: BorderSide(
                                      //                       width: 0.5,
                                      //                       color: Styles
                                      //                           .greyLight
                                      //                           .withOpacity(
                                      //                               0.18)),
                                      //                 ),
                                      //                 disabledBorder:
                                      //                     OutlineInputBorder(
                                      //                   borderRadius:
                                      //                       BorderRadius
                                      //                           .circular(9),
                                      //                   borderSide: BorderSide(
                                      //                     width: 0.5,
                                      //                     color: Styles
                                      //                         .greyLight
                                      //                         .withOpacity(
                                      //                             0.18),
                                      //                     style:
                                      //                         BorderStyle.none,
                                      //                   ),
                                      //                 ),
                                      //                 border:
                                      //                     OutlineInputBorder(
                                      //                   borderRadius:
                                      //                       BorderRadius
                                      //                           .circular(9),
                                      //                   borderSide: BorderSide(
                                      //                     width: 0.5,
                                      //                     color: Styles
                                      //                         .greyLight
                                      //                         .withOpacity(
                                      //                             0.18),
                                      //                   ),
                                      //                 ),
                                      //                 fillColor: Styles
                                      //                     .greyLight
                                      //                     .withOpacity(0.10)),
                                      //             value: controller
                                      //                 .countryModelData,
                                      //             items:
                                      //                 controller.country.data!
                                      //                     .map((e) =>
                                      //                         DropdownMenuItem(
                                      //                           value: e,
                                      //                           child: CustomTextWidget(
                                      //                               color: Styles
                                      //                                   .white,
                                      //                               text:
                                      //                                   e.name ??
                                      //                                       ""),
                                      //                         ))
                                      //                     .toList(),
                                      //             onChanged:
                                      //                 (contryModelsData) {}),
                                      //       ),

                                      const SizedBox(height: 20),
                                    ],
                                  ),
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
                              title: "Create my account",
                              fontColor: Styles.black,
                              bgColor: Styles.orangeYellow,
                              fontSize: 16,
                              onTap: () {
                                if (controller.signupFormKey.currentState!
                                    .validate()) {
                                  controller.register();
                                }
                              },
                            ),
                            const SizedBox(height: 19),
                            RichTextWidget(
                              text: "Already have an account ?",
                              onTapText: " Login",
                              color: Styles.white,
                              onTapColor: Styles.orangeYellow,
                              onTapFontWeight: FontWeight.bold,
                            ),
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
      },
    );
  }

  // void _openCountryPickerDialog(BuildContext context) {
  //   showCountryPicker(
  //     context: context,
  //     onSelect: (Country country) {
  //       controller.selectCountry(country);
  //       // Navigator.pop(context);
  //     },

  //     // useSafeArea: true,

  //     showPhoneCode: false,
  //     countryListTheme: CountryListThemeData(
  //       inputDecoration: InputDecoration(
  //         contentPadding: const EdgeInsets.all(2),
  //         filled: true,
  //         hintText: "Search",
  //         hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: "Manrope", color: Styles.solidGrey.withOpacity(0.6)),
  //         enabledBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(9),
  //           borderSide: BorderSide(
  //             width: 0.5,
  //             color: Styles.white.withOpacity(0.5),
  //             style: BorderStyle.none,
  //           ),
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(9),
  //           borderSide: const BorderSide(
  //             color: Styles.orangeBorder,
  //           ),
  //         ),
  //         errorBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(9),
  //           borderSide: const BorderSide(
  //             color: Color(0xFFF7F7F7),
  //           ),
  //         ),
  //         focusedErrorBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(9),
  //           borderSide: const BorderSide(
  //             color: Color(0xFFF7F7F7),
  //           ),
  //         ),
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(9),
  //           borderSide: const BorderSide(
  //             width: 0,
  //             style: BorderStyle.none,
  //           ),
  //         ),
  //         counterStyle: TextStyle(fontFamily: "Manrope", fontSize: 12, fontWeight: FontWeight.w600, color: Styles.solidGrey.withOpacity(0.8)),
  //         prefixIcon: const Padding(
  //           padding: EdgeInsets.all(16.0),
  //           child: SvgIconComponent(
  //             icon: "search_black_2x.svg",
  //             color: Styles.greyLight,
  //           ),
  //         ),
  //         fillColor: controller.focusNumber.hasFocus ? Styles.white : Styles.greyLight.withOpacity(0.10),
  //         focusColor: controller.focusNumber.hasFocus ? Styles.orangeBorder : Styles.white,
  //       ),
  //       borderRadius: BorderRadius.circular(5),
  //       flagSize: 30.0,
  //       backgroundColor: Colors.white,
  //       textStyle: const TextStyle(
  //         fontSize: 14.0,
  //         fontFamily: "Menrope",
  //         fontWeight: FontWeight.w600,
  //       ),
  //     ),
  //   );
  // }
}
