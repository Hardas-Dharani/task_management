import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_text_component.dart';

import '../../../components/custom_appbar_component.dart';
import '../../../components/custom_button_component.dart';
import '../../../components/custom_textfield_component.dart';
import '../../../components/main_scaffold_component.dart';
import '../../../utils/styles.dart';
import 'controller/create_employment_controller.dart';

class CreateEmploymentScreen extends GetView<CreateEmploymentController> {
  const CreateEmploymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateEmploymentController>(
      init: CreateEmploymentController(),
      initState: (v) {
        // controller.selectedCountryCode = Get.arguments["selectedCountryCode"];
      },
      builder: (_) {
        // final selectedCountryInfo = controller.selectedCountryInfo;
        return MainScaffold(
          backgroundColor: Styles.black,
          appBar: CustomAppBar(
            backButtonColor: Colors.white,
            title: "Add Employment",
            bgColor: Styles.black,
            titleColor: Styles.black,
            leading: true,
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
                            const SizedBox(height: 20),

                            const SizedBox(height: 33),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomTextWidget(
                                  text:
                                      "Please add your employment\ncomplete details",
                                  color: Styles.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                CustomTextField(
                                  textFieldColor: controller.focusName.hasFocus
                                      ? Styles.white
                                      : Styles.white,
                                  maxLines: 1,
                                  fillColor: controller.focusName.hasFocus
                                      ? Styles.white
                                      : Styles.greyLight.withOpacity(0.10),
                                  focusColor: controller.focusName.hasFocus
                                      ? Styles.orangeYellow
                                      : Styles.white,
                                  hint: "Company Name",
                                  hintFontSize: 16,
                                  validatorFtn: (value) {
                                    if (value == "") {
                                      return "Field cannot be empty";
                                    }
                                    return null;
                                  },
                                  hintColor: Styles.solidGrey,
                                  txtController:
                                      controller.titleTextEditingController,
                                  textInputAction: TextInputAction.next,
                                  node: controller.focusName,
                                  onTap: () {},
                                  padding: 17,
                                  borderRadius: 9,
                                ),
                                const SizedBox(height: 20),
                                CustomTextField(
                                  maxLines: 1,
                                  validatorFtn: (value) {
                                    if (value == "") {
                                      return "Field cannot be empty";
                                    }
                                    return null;
                                  },
                                  fillColor: controller.focusEmail.hasFocus
                                      ? Styles.white
                                      : Styles.greyLight.withOpacity(0.10),
                                  focusColor: controller.focusEmail.hasFocus
                                      ? Styles.orangeYellow
                                      : Styles.white,
                                  hint: "Designation",
                                  hintFontSize: 16,
                                  hintColor: Styles.solidGrey,
                                  textInputType: TextInputType.emailAddress,
                                  txtController:
                                      controller.projectTextEditingController,
                                  textInputAction: TextInputAction.next,
                                  node: controller.focusEmail,
                                  onTap: () {},
                                  padding: 17,
                                  borderRadius: 9,
                                ),
                                const SizedBox(height: 20),
                                CustomTextField(
                                  maxLines: 1,
                                  validatorFtn: (value) {
                                    if (value == "") {
                                      return "Field cannot be empty";
                                    }
                                    return null;
                                  },
                                  fillColor: controller.focusCpassword.hasFocus
                                      ? Styles.white
                                      : Styles.greyLight.withOpacity(0.10),
                                  focusColor: controller.focusCpassword.hasFocus
                                      ? Styles.orangeYellow
                                      : Styles.white,
                                  hint: "City",
                                  hintFontSize: 16,
                                  hintColor: Styles.solidGrey,
                                  textInputType: TextInputType.text,
                                  txtController:
                                      controller.cPasswordTextEditingController,
                                  textInputAction: TextInputAction.next,
                                  node: controller.focusCpassword,
                                  onTap: () {},
                                  padding: 17,
                                  borderRadius: 9,
                                ),
                                const SizedBox(height: 20),
                                controller.country.data == null
                                    ? const SizedBox()
                                    : Container(
                                        decoration: BoxDecoration(
                                            color: Styles.greyLight
                                                .withOpacity(0.18),
                                            borderRadius:
                                                BorderRadius.circular(9)),
                                        child: DropdownButtonFormField(
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                  borderSide: BorderSide(
                                                    width: 0.5,
                                                    color: Styles.greyLight
                                                        .withOpacity(0.18),
                                                    style: BorderStyle.none,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                  borderSide: BorderSide(
                                                      width: 0.5,
                                                      color: Styles.greyLight
                                                          .withOpacity(0.18)),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                  borderSide: BorderSide(
                                                      width: 0.5,
                                                      color: Styles.greyLight
                                                          .withOpacity(0.18)),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                  borderSide: BorderSide(
                                                      width: 0.5,
                                                      color: Styles.greyLight
                                                          .withOpacity(0.18)),
                                                ),
                                                disabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                  borderSide: BorderSide(
                                                    width: 0.5,
                                                    color: Styles.greyLight
                                                        .withOpacity(0.18),
                                                    style: BorderStyle.none,
                                                  ),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                  borderSide: BorderSide(
                                                    width: 0.5,
                                                    color: Styles.greyLight
                                                        .withOpacity(0.18),
                                                  ),
                                                ),
                                                fillColor: Styles.greyLight
                                                    .withOpacity(0.10)),
                                            value: controller.countryModelData,
                                            items: controller.country.data!
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: CustomTextWidget(
                                                          text: e.name ?? ""),
                                                    ))
                                                .toList(),
                                            onChanged: (contryModelsData) {}),
                                      ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomTextField(
                                        textFieldColor:
                                            controller.focusNumber.hasFocus
                                                ? Styles.white
                                                : Styles.white,
                                        maxLines: 1,
                                        fillColor:
                                            controller.focusNumber.hasFocus
                                                ? Styles.white
                                                : Styles.greyLight
                                                    .withOpacity(0.10),
                                        focusColor:
                                            controller.focusNumber.hasFocus
                                                ? Styles.orangeYellow
                                                : Styles.white,
                                        hint: "Start",
                                        hintFontSize: 16,
                                        suffixWidget: IconButton(
                                            onPressed: () {
                                              controller.selectDate(context);
                                            },
                                            icon: const Icon(
                                              Icons.calendar_today,
                                              color: Styles.white,
                                            )),
                                        hintColor: Styles.solidGrey,
                                        textInputType: TextInputType.text,
                                        txtController: controller
                                            .startDateTextEditingController,
                                        textInputAction: TextInputAction.next,
                                        node: controller.focusNumber,
                                        readOnly: true,
                                        onTap: () {},
                                        padding: 17,
                                        borderRadius: 9,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: CustomTextField(
                                        textFieldColor:
                                            controller.focusLanguage.hasFocus
                                                ? Styles.white
                                                : Styles.white,
                                        maxLines: 1,
                                        fillColor:
                                            controller.focusLanguage.hasFocus
                                                ? Styles.white
                                                : Styles.greyLight
                                                    .withOpacity(0.10),
                                        focusColor:
                                            controller.focusLanguage.hasFocus
                                                ? Styles.orangeYellow
                                                : Styles.white,
                                        hint: "Ending",
                                        hintFontSize: 16,
                                        suffixWidget: IconButton(
                                            onPressed: () {
                                              // if (controller.checked != true) {
                                              controller.selecEndDate(context);
                                              // }
                                            },
                                            icon: const Icon(
                                              Icons.calendar_today,
                                              color: Styles.white,
                                            )),
                                        hintColor: Styles.solidGrey,
                                        textInputType: TextInputType.text,
                                        txtController: controller
                                            .endDateTextEditingController,
                                        textInputAction: TextInputAction.next,
                                        node: controller.focusLanguage,
                                        onTap: () {},
                                        padding: 17,
                                        borderRadius: 9,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                        checkColor: Styles.white,
                                        activeColor: Styles.orangeYellow,
                                        // fillColor:
                                        //     const MaterialStatePropertyAll(
                                        //         Styles.orangeYellow),
                                        value: controller.checked,
                                        onChanged: (value) {
                                          controller.checked = value!;
                                          controller.update();
                                        }),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const CustomTextWidget(
                                      text: "I am currently work here",
                                      fontWeight: FontWeight.normal,
                                      color: Styles.white,
                                      fontSize: 12,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  maxLines: 5,
                                  minLines: 5,
                                  fillColor: controller.focusCdescr.hasFocus
                                      ? Styles.white
                                      : Styles.greyLight.withOpacity(0.10),
                                  focusColor: controller.focusCdescr.hasFocus
                                      ? Styles.orangeYellow
                                      : Styles.white,
                                  hint: "Description",
                                  hintFontSize: 16,
                                  validatorFtn: (value) {
                                    if (value == "") {
                                      return "Field cannot be empty";
                                    }
                                    return null;
                                  },
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.selectDate(context);
                                      },
                                      icon: const Icon(
                                        Icons.calendar_today,
                                        color: Styles.white,
                                      )),
                                  hintColor: Styles.solidGrey,
                                  textInputType: TextInputType.text,
                                  txtController: controller
                                      .descriptionTextEditingController,
                                  textInputAction: TextInputAction.next,
                                  node: controller.focusCdescr,
                                  onTap: () {},
                                  padding: 17,
                                  borderRadius: 9,
                                ),
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
                              title: "Continue",
                              fontColor: Styles.black,
                              bgColor: Styles.orangeYellow,
                              fontSize: 16,
                              onTap: () {
                                if (controller.signupFormKey.currentState!
                                    .validate()) {
                                  controller.createTask();
                                }
                              },
                            ),
                            const SizedBox(height: 19),
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
