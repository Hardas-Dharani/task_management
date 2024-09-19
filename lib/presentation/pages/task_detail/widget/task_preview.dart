import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/custom_appbar_component.dart';
import '../../../../components/custom_button_component.dart';
import '../../../../components/custom_text_component.dart';
import '../../../../components/main_scaffold_component.dart';
import '../../../../utils/styles.dart';
import '../controller/task_detail_controller.dart';

class TaskPreviewScreen extends GetView<TaskDetailController> {
  const TaskPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: CustomButton(
          onTap: () {
            controller.accpetTask(
                (controller.taskDetailModel.data?.task?.id ?? 0).toString());
          },
          bgColor: Styles.orangeYellow,
          radius: 10,
          title: "Accept",
        ),
      ),
      backgroundColor: Styles.black,
      // bottomNavigationBar: const SizedBox(),
      appBar: CustomAppBar(
        bgColor: Styles.black,
        backButtonColor: Colors.white,
        title: "Payment Method",
        titleColor: Styles.white,
        leading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              decoration: const BoxDecoration(color: Styles.orangeYellow),
              width: Get.width,
              child: const CustomTextWidget(
                text: "Task Preview",
                color: Styles.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            GetBuilder<TaskDetailController>(builder: (_) {
              return controller.taskDetailModel.data == null
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              CustomTextWidget(
                                text: "Task Details:",
                                color: Styles.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              )
                            ],
                          ),
                          titleAndSubTitle(
                              "Enter your project title",
                              controller.taskDetailModel.data!.task!.title ??
                                  ""),
                          titleAndSubTitle(
                              "What needs to be done?",
                              controller.taskDetailModel.data!.task!
                                      .description ??
                                  ""),
                          controller.taskDetailModel.data!.task!.files!.isEmpty
                              ? const SizedBox.shrink()
                              : const Padding(
                                  padding: EdgeInsets.only(top: 25),
                                  child: CustomTextWidget(
                                    text: "Upload your project file",
                                    color: Styles.orangeYellow,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                          Wrap(
                            spacing: 10.0, // gap between adjacent items
                            runSpacing: 10.0, // gap between lines
                            children: List.generate(
                              controller.taskDetailModel.data!.task!.files!
                                  .length, // number of icons to display
                              (index) => Styles().checkWhichFile(controller
                                  .taskDetailModel
                                  .data!
                                  .task!
                                  .files![index]
                                  .source!),
                            ),
                          ),
                          titleAndSubTitle(
                              "When should it be done?",
                              controller.taskDetailModel.data!.task!.deadline ??
                                  ""),
                          titleAndSubTitle(
                              "Type of assignment",
                              controller.taskDetailModel.data!.task!.typeId == 1
                                  ? "Essay"
                                  : "Essay"),
                          controller.taskDetailModel.data!.task!.typeId != 1
                              ? const SizedBox.shrink()
                              : titleAndSubTitle(
                                  "How many words?",
                                  controller
                                      .taskDetailModel.data!.task!.wordCount),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    );
            })
          ],
        ),
      ),
    );
  }

  Widget titleAndSubTitle(String? title, String? subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: CustomTextWidget(
            text: title ?? "Enter your project title",
            color: Styles.orangeYellow,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: CustomTextWidget(
            text: subTitle ?? "Task Title",
            color: Styles.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
