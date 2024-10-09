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
      builder: (_) {
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Styles.screenPadding),
                  child: Form(
                    key: controller.signupFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const CustomTextWidget(
                          text: "Enter your project title",
                          color: Styles.white,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          textFieldColor: controller.focusName.hasFocus
                              ? Styles.black
                              : Styles.white,
                          maxLines: 1,
                          maxLength: 200,
                          fillColor: controller.focusName.hasFocus
                              ? Styles.white
                              : Styles.greyLight.withOpacity(0.10),
                          focusColor: controller.focusName.hasFocus
                              ? Styles.orangeYellow
                              : Styles.white,
                          hint: "Title",
                          hintFontSize: 16,
                          hintColor: Styles.solidGrey,
                          txtController: controller.titleTextEditingController,
                          textInputAction: TextInputAction.next,
                          node: controller.focusName,
                          padding: 17,
                          borderRadius: 9,
                          validatorFtn: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Project title is required';
                            }
                            return null;
                          },
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
                          maxLength: 10000,
                          hintColor: Styles.solidGrey,
                          textInputType: TextInputType.text,
                          minLines: 5,
                          txtController:
                              controller.descriptionTextEditingController,
                          textInputAction: TextInputAction.next,
                          node: controller.focusCpassword,
                          padding: 17,
                          borderRadius: 9,
                          validatorFtn: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Project description is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
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
                          hintColor: Styles.solidGrey,
                          textInputType: TextInputType.text,
                          readOnly: true,
                          suffixWidget: IconButton(
                            onPressed: controller.selectFile,
                            icon: Image.asset(
                              "assets/images/file_upload.png",
                              height: 15,
                              width: 15,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Wrap(
                          spacing: 10.0,
                          runSpacing: 10.0,
                          children: List.generate(
                            controller.listFileSelected.length,
                            (index) => Styles().checkWhichFile(
                                controller.listFileSelected[index].path),
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
                          textFieldColor: controller.focusNumber.hasFocus
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
                          hintColor: Styles.solidGrey,
                          textInputType: TextInputType.text,
                          txtController:
                              controller.startDateTextEditingController,
                          readOnly: true,
                          suffixWidget: IconButton(
                            onPressed: () => controller.selectDate(context),
                            icon: const Icon(
                              Icons.calendar_today,
                              color: Styles.white,
                            ),
                          ),
                          validatorFtn: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please select a due date';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        if (controller.preRequestModel.data != null) ...[
                          const CustomTextWidget(
                            text: "Type of assignment",
                            color: Styles.white,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 20),
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9),
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Styles.greyLight.withOpacity(0.10),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9),
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Styles.greyLight.withOpacity(0.10),
                                ),
                              ),
                            ),
                            value: controller.preRequestModelTypes,
                            items: controller.preRequestModel.data!.types!
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
                            },
                          ),
                        ],
                        const SizedBox(height: 20),
                        if (controller.preRequestModelTypes.id == 1) ...[
                          const CustomTextWidget(
                            text: "How many words?",
                            color: Styles.white,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            maxLines: 1,
                            fillColor: Styles.greyLight.withOpacity(0.10),
                            focusColor: Styles.white,
                            hint: "Word Count",
                            hintFontSize: 16,
                            inputFormat: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            txtController: controller.wordCountText,
                            validatorFtn: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter the word count';
                              }
                              return null;
                            },
                          ),
                        ],
                        const SizedBox(height: 38),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.red,
                                    size: 12,
                                  ),
                                ),
                                const WidgetSpan(
                                  child: SizedBox(width: 5),
                                ),
                                TextSpan(
                                  text: controller.preRequestModelTypes.id == 1
                                      ? "Word count selected. Payment policy applies."
                                      : "No word count. Awaiting quotation.",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 38),
                        CustomButton(
                          title: "Continue",
                          bgColor: Styles.orangeYellow,
                          fontColor: Styles.black,
                          fontSize: 16,
                          onTap: () {
                            // Get.to(const ShareFriendDetailScreen());
                            if (controller.signupFormKey.currentState!
                                .validate()) {
                              Get.to(const ShareFriendDetailScreen());
                            }
                          },
                        ),
                        const SizedBox(height: 38),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
