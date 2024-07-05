import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/services/local_storage.dart';
import '../../../../components/custom_appbar_component.dart';
import '../../../../components/custom_button_component.dart';
import '../../../../components/custom_text_component.dart';
import '../../../../components/main_scaffold_component.dart';
import '../../../../data/models/task_detail_model.dart';
import '../../../../utils/styles.dart';
import '../../task_detail/controller/task_detail_controller.dart';
import '../controller/admin_home_controller.dart';

class TaskTab extends StatelessWidget {
  final int? id;
  const TaskTab({super.key, this.id});
  @override
  Widget build(BuildContext context) {
    Get.put(TaskDetailController());
    return MainScaffold(
      backgroundColor: Styles.black,
      bottomNavigationBar: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
        child: CustomButton(
          onTap: () {
            Get.find<AdminHomeController>().showQuotationCustomDialog(
                Get.find<AdminHomeController>()
                    .taskDetailModel
                    .data!
                    .task!
                    .id!
                    .toString());
          },
          radius: 10,
          bgColor: Styles.orangeYellow,
          title: "Send Quote",
          borderColor: Styles.orangeYellow,
        ),
      ),
      appBar: CustomAppBar(
        bgColor: Styles.black,
        backButtonColor: Colors.white,
        title: "Quotation Task",
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
                text: "Quotation Requirement",
                color: Styles.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GetBuilder<AdminHomeController>(initState: (state) {
              Get.find<AdminHomeController>().getTaskDetail(id.toString());
            }, builder: (controller) {
              return controller.taskDetailModel.data == null
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 0),
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
                              "",
                              controller.taskDetailModel.data!.task!.title ??
                                  ""),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/person_image.png",
                                height: 40,
                                width: 40,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              controller.taskDetailModel.data!.task!.student ==
                                      null
                                  ? const SizedBox.shrink()
                                  : CustomTextWidget(
                                      text: controller.taskDetailModel.data!
                                              .task!.student!.name ??
                                          "",
                                      color: Styles.white,
                                      fontSize: 14,
                                    )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextWidget(
                            text: Styles().StringConvertDateTime(controller
                                .taskDetailModel.data!.task!.deadline!),
                            color: Styles.white,
                            fontSize: 14,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomTextWidget(
                            text: "Task Detail",
                            color: Styles.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextWidget(
                            text: controller
                                    .taskDetailModel.data!.task!.description ??
                                "",
                            color: Styles.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),

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

                          Get.find<LocalStorageService>()
                                      .loginModel!
                                      .data!
                                      .user!
                                      .roleId !=
                                  2
                              ? controller.taskDetailModel.data!.task!.typeId !=
                                      1
                                  ? const SizedBox.shrink()
                                  : titleAndSubTitle(
                                      "How many words?",
                                      controller.taskDetailModel.data!.task!
                                          .wordCount)
                              : const SizedBox.shrink(),
                          const SizedBox(
                            height: 10,
                          ),
                          Get.find<LocalStorageService>()
                                      .loginModel!
                                      .data!
                                      .user!
                                      .roleId !=
                                  2
                              ? const SizedBox.shrink()
                              : controller.taskDetailModel.data!.task!.fee ==
                                      null
                                  ? const SizedBox.shrink()
                                  : const Divider(
                                      color: Styles.white,
                                    ),
                          Get.find<LocalStorageService>()
                                      .loginModel!
                                      .data!
                                      .user!
                                      .roleId !=
                                  2
                              ? const SizedBox.shrink()
                              : controller.taskDetailModel.data!.task!.fee ==
                                      null
                                  ? const SizedBox.shrink()
                                  : Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: CustomTextWidget(
                                          text:
                                              "\$${controller.taskDetailModel.data!.task!.fee.toString()}",
                                          fontSize: 35,
                                          fontWeight: FontWeight.w600,
                                          color: Styles.orangeYellow,
                                        ),
                                      ),
                                    ),
                          Get.find<LocalStorageService>()
                                      .loginModel!
                                      .data!
                                      .user!
                                      .roleId !=
                                  2
                              ? const SizedBox.shrink()
                              : controller.taskDetailModel.data!.task!.fee ==
                                      null
                                  ? const SizedBox.shrink()
                                  : const Divider(
                                      color: Styles.white,
                                    ),
                          Get.find<LocalStorageService>()
                                      .loginModel!
                                      .data!
                                      .user!
                                      .roleId !=
                                  2
                              ? const SizedBox.shrink()
                              : const SizedBox(
                                  height: 25,
                                ),
                          Get.find<LocalStorageService>()
                                      .loginModel!
                                      .data!
                                      .user!
                                      .roleId !=
                                  2
                              ? const SizedBox.shrink()
                              : controller.taskDetailModel.data!.task!
                                          .teacher ==
                                      null
                                  ? const SizedBox.shrink()
                                  : const Row(
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
                          Get.find<LocalStorageService>()
                                      .loginModel!
                                      .data!
                                      .user!
                                      .roleId !=
                                  2
                              ? const SizedBox.shrink()
                              : controller.taskDetailModel.data!.task!
                                          .teacher ==
                                      null
                                  ? const SizedBox.shrink()
                                  : selectedTeacher(controller
                                      .taskDetailModel.data!.task!.teacher!),
                          //  ListView.builder(
                          //     shrinkWrap: true,
                          //     itemCount: controller.selectedIdTeacher.length,
                          //     itemBuilder: (context, index) {
                          //       return selectedTeacher(
                          //           controller.selectedIdTeacher[index]);
                          //     },
                          //   ),
                          const SizedBox(
                            height: 15,
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

  Widget selectedTeacher(Student teachers) {
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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: teachers.name ?? "",
                color: Styles.white,
              ),
              CustomTextWidget(
                text: teachers.gender ?? '',
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
