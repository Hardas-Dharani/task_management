import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_text_component.dart';

import '../../../components/custom_appbar_component.dart';
import '../../../components/custom_button_component.dart';
import '../../../components/custom_textfield_component.dart';
import '../../../components/main_scaffold_component.dart';
import '../../../utils/styles.dart';
import 'controller/create_task_controller.dart';
import 'widget/share_user.dart';

class CreateTaskScreen extends GetView<CreateTaskController> {
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateTaskController>(
      init: CreateTaskController(),
      initState: (v) {
        // controller.selectedCountryCode = Get.arguments["selectedCountryCode"];
      },
      builder: (_) {
        // final selectedCountryInfo = controller.selectedCountryInfo;
        return MainScaffold(
          backgroundColor: Styles.black,
          appBar: CustomAppBar(
            bgColor: Styles.black,
            backButtonColor: Colors.white,
            title: "Create Task",
            titleColor: Styles.white,
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
                                  text: "Enter your project title",
                                  color: Styles.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  textFieldColor: controller.focusName.hasFocus
                                      ? Styles.black
                                      : Styles.white,
                                  maxLines: 1,
                                  fillColor: controller.focusName.hasFocus
                                      ? Styles.white
                                      : Styles.greyLight.withOpacity(0.10),
                                  focusColor: controller.focusName.hasFocus
                                      ? Styles.orangeYellow
                                      : Styles.white,
                                  hint: "Title",
                                  hintFontSize: 16,
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
                                const CustomTextWidget(
                                  text: "Describe Project",
                                  color: Styles.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(height: 20),
                                CustomTextField(
                                  maxLines: 8,
                                  fillColor: controller.focusCpassword.hasFocus
                                      ? Styles.white
                                      : Styles.greyLight.withOpacity(0.10),
                                  focusColor: controller.focusCpassword.hasFocus
                                      ? Styles.orangeYellow
                                      : Styles.white,
                                  hint: "Description",
                                  hintFontSize: 16,
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.selectDate(context);
                                      },
                                      icon: const Icon(
                                        Icons.calendar_today,
                                        color: Styles.black,
                                      )),
                                  hintColor: Styles.solidGrey,
                                  textInputType: TextInputType.text,
                                  minLines: 5,
                                  txtController: controller
                                      .descriptionTextEditingController,
                                  textInputAction: TextInputAction.next,
                                  node: controller.focusCpassword,
                                  onTap: () {},
                                  padding: 17,
                                  borderRadius: 9,
                                ),
                                const SizedBox(height: 20),

                                // const SizedBox(height: 20),
                                // const CustomTextWidget(
                                //   text: "Enter your project title",
                                //   color: Styles.white,
                                //   fontWeight: FontWeight.bold,
                                // ),
                                // const SizedBox(
                                //   height: 20,
                                // ),
                                // CustomTextField(
                                //   maxLines: 1,
                                //   fillColor: controller.focusEmail.hasFocus
                                //       ? Styles.white
                                //       : Styles.greyLight.withOpacity(0.10),
                                //   focusColor: controller.focusEmail.hasFocus
                                //       ? Styles.orangeYellow
                                //       : Styles.white,
                                //   hint: "Project Budget",
                                //   hintFontSize: 16,
                                //   hintColor: Styles.solidGrey,
                                //   textInputType: TextInputType.emailAddress,
                                //   txtController:
                                //       controller.projectTextEditingController,
                                //   textInputAction: TextInputAction.next,
                                //   node: controller.focusEmail,
                                //   onTap: () {},
                                //   padding: 17,
                                //   borderRadius: 9,
                                // ),
                                const CustomTextWidget(
                                  text: "Upload your project file",
                                  color: Styles.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(height: 20),
                                CustomTextField(
                                  textFieldColor: Styles.white,
                                  maxLines: 1,
                                  fillColor: Styles.greyLight.withOpacity(0.10),
                                  focusColor: Styles.white,
                                  hint: "File Upload",
                                  hintFontSize: 16,
                                  suffixWidget: IconButton(
                                      onPressed: () {
                                        controller.selectFile();
                                      },
                                      icon: Image.asset(
                                        "assets/images/file_upload.png",
                                        height: 15,
                                        width: 15,
                                      )),
                                  hintColor: Styles.solidGrey,
                                  textInputType: TextInputType.text,
                                  // txtController:
                                  //     controller.startDateTextEditingController,
                                  textInputAction: TextInputAction.next,
                                  // node: controller.focusNumber,
                                  readOnly: true,
                                  onTap: () {},
                                  padding: 17,
                                  borderRadius: 9,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Wrap(
                                  spacing: 10.0, // gap between adjacent items
                                  runSpacing: 10.0, // gap between lines
                                  children: List.generate(
                                    controller.listFileSelected
                                        .length, // number of icons to display
                                    (index) => Styles().checkWhichFile(
                                        controller
                                            .listFileSelected[index].path),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const CustomTextWidget(
                                  text: "When should it be done?",
                                  color: Styles.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(height: 20),
                                CustomTextField(
                                  textFieldColor:
                                      controller.focusNumber.hasFocus
                                          ? Styles.black
                                          : Styles.white,
                                  maxLines: 1,
                                  fillColor: controller.focusNumber.hasFocus
                                      ? Styles.white
                                      : Styles.greyLight.withOpacity(0.10),
                                  focusColor: controller.focusNumber.hasFocus
                                      ? Styles.orangeYellow
                                      : Styles.white,
                                  hint: "MM/DD/YYYY",
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
                                  txtController:
                                      controller.startDateTextEditingController,
                                  textInputAction: TextInputAction.next,
                                  node: controller.focusNumber,
                                  readOnly: true,
                                  onTap: () {},
                                  padding: 17,
                                  borderRadius: 9,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                controller.preRequestModel.data == null
                                    ? const SizedBox()
                                    : const CustomTextWidget(
                                        text: "Type of assignment",
                                        color: Styles.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                controller.preRequestModel.data == null
                                    ? const SizedBox()
                                    : const SizedBox(height: 20),
                                controller.preRequestModel.data == null
                                    ? const SizedBox()
                                    : Container(
                                        decoration: BoxDecoration(
                                            color: Styles.greyLight
                                                .withOpacity(0.10),
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
                                                        .withOpacity(0.10),
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
                                                          .withOpacity(0.10)),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                  borderSide: BorderSide(
                                                      width: 0.5,
                                                      color: Styles.greyLight
                                                          .withOpacity(0.10)),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                  borderSide: BorderSide(
                                                      width: 0.5,
                                                      color: Styles.greyLight
                                                          .withOpacity(0.10)),
                                                ),
                                                disabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                  borderSide: BorderSide(
                                                    width: 0.5,
                                                    color: Styles.greyLight
                                                        .withOpacity(0.10),
                                                    style: BorderStyle.none,
                                                  ),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                  borderSide: BorderSide(
                                                    width: 0.5,
                                                    color: Styles.greyLight
                                                        .withOpacity(0.10),
                                                  ),
                                                ),
                                                fillColor: Styles.greyLight
                                                    .withOpacity(0.10)),
                                            value:
                                                controller.preRequestModelTypes,
                                            items: controller
                                                .preRequestModel.data!.types!
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: CustomTextWidget(
                                                        text: e.title ?? "",
                                                        color: Styles.solidGrey,
                                                      ),
                                                    ))
                                                .toList(),
                                            onChanged: (contryModelsData) {
                                              controller.preRequestModelTypes =
                                                  contryModelsData!;
                                              controller.update();
                                            }),
                                      ),

                                const SizedBox(
                                  height: 20,
                                ),
                                controller.preRequestModelTypes.id == 1
                                    ? const CustomTextWidget(
                                        text: "How many words?",
                                        color: Styles.white,
                                        fontWeight: FontWeight.bold,
                                      )
                                    : const SizedBox.shrink(),

                                controller.preRequestModelTypes.id == 1
                                    ? const SizedBox(height: 20)
                                    : const SizedBox.shrink(),
                                controller.preRequestModelTypes.id == 1
                                    ? CustomTextField(
                                        maxLines: 1,
                                        fillColor:
                                            Styles.greyLight.withOpacity(0.10),
                                        focusColor: Styles.white,
                                        hint: "Word Count",
                                        inputFormat: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        hintFontSize: 16,
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              controller.selectDate(context);
                                            },
                                            icon: const Icon(
                                              Icons.calendar_today,
                                              color: Styles.black,
                                            )),
                                        hintColor: Styles.solidGrey,
                                        textInputType: TextInputType.number,
                                        txtController: controller.wordCountText,
                                        textInputAction: TextInputAction.next,
                                        // node: controller.focusCpassword,
                                        onTap: () {},
                                        padding: 17,
                                        borderRadius: 9,
                                      )
                                    : const SizedBox.shrink(),
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
                              bgColor: Styles.orangeYellow,
                              fontColor: Styles.black,
                              fontSize: 16,
                              onTap: () {
                                Get.to(const ShareFriendDetailScreen());
                                // if (controller.signupFormKey.currentState!
                                //     .validate()) {
                                //   // Get.to(const ShareFriendDetailScreen());

                                // }
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
