import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_text_component.dart';

import '../../../../components/custom_appbar_component.dart';
import '../../../../components/main_scaffold_component.dart';
import '../../../../utils/styles.dart';
import '../controller/create_task_controller.dart';

class PreviewTaskDetail extends GetView<CreateTaskController> {
  const PreviewTaskDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      backgroundColor: Styles.black,
      // bottomNavigationBar: const SizedBox(),
      appBar: CustomAppBar(
        bgColor: Styles.black,
        backButtonColor: Colors.white,
        title: "Create Task",
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
                text: "Preview Task",
                color: Styles.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                  titleAndSubTitle("Enter your project title",
                      controller.titleTextEditingController.text),
                  titleAndSubTitle("What needs to be done?",
                      controller.descriptionTextEditingController.text),
                  const Padding(
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
                      controller.listFileSelected
                          .length, // number of icons to display
                      (index) => const Icon(
                        Icons.star,
                        size: 50.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  titleAndSubTitle("When should it be done?",
                      controller.startDateTextEditingController.text),
                  titleAndSubTitle("Type of assignment",
                      controller.preRequestModelTypes.title),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Styles.white,
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CustomTextWidget(
                        text: "\$30.00",
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Styles.orangeYellow,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Styles.white,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Row(
                    children: [
                      CustomTextWidget(
                        text: "Selected Teachers:",
                        color: Styles.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return selectedTeacher();
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.createTask();
                    },
                    child: Container(
                      height: 55,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Styles.orangeYellow),
                      width: Get.width,
                      alignment: Alignment.center,
                      child: const CustomTextWidget(
                        text: "Create Task",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget selectedTeacher() {
    return Row(
      children: [
        Image.asset(
          "assets/images/teacher_icon.png",
          height: 79,
          width: 79,
        ),
        const SizedBox(
          width: 10,
        ),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: "Gayle",
                color: Styles.white,
              ),
              CustomTextWidget(
                text:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                color: Styles.white,
                fontSize: 9,
              )
            ],
          ),
        ),
      ],
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
