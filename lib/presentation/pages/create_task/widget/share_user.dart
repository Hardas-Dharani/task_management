import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_appbar_component.dart';
import 'package:task_management/components/custom_text_component.dart';
import 'package:task_management/presentation/pages/create_task/widget/preview_task.dart';
import 'package:task_management/utils/styles.dart';

import '../../../../components/main_scaffold_component.dart';
import '../controller/create_task_controller.dart';

class ShareFriendDetailScreen extends GetView<CreateTaskController> {
  final String? id;
  const ShareFriendDetailScreen({super.key, this.id});
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      backgroundColor: Styles.black,
      // drawarBar: const CustomDrawer(),
      appBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomAppBar(
          bgColor: Styles.black,
          title: "Create Task",
          titleColor: Styles.white,
          // trailing: IconButton(
          //     onPressed: () {
          //       Get.toNamed(Routes.chats);
          //     },
          //     icon: Image.asset(
          //       "assets/images/icons/menu_icon.png",
          //       width: 20,
          //       color: Styles.white,
          //       height: 20,
          //     )),
          leading: true,
        ),
      ),
      body: GetBuilder<CreateTaskController>(
        init: CreateTaskController(),
        builder: (_) {
          return Column(
            children: [
              const Divider(
                height: 2,
                color: Styles.orangeYellow,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: CustomTextWidget(
                  text: "Select Teachers",
                  color: Styles.orangeYellow,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Divider(
                height: 2,
                color: Styles.orangeYellow,
              ),
              controller.preRequestModel.data == null
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          shrinkWrap: true,
                          itemCount:
                              controller.preRequestModel.data!.teachers!.length,
                          itemBuilder: (context, index) {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextWidget(
                                        text: controller.preRequestModel.data!
                                                .teachers![index].name ??
                                            "",
                                        color: Styles.white,
                                      ),
                                      CustomTextWidget(
                                        text: controller.preRequestModel.data!
                                                .teachers![index].gender ??
                                            "",
                                        color: Styles.white,
                                        fontSize: 7,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),

                                GestureDetector(
                                  onTap: () async {
                                    controller.preRequestModel.data!
                                            .teachers![index].selected =
                                        !controller.preRequestModel.data!
                                            .teachers![index].selected!;
                                    if (controller.preRequestModel.data!
                                        .teachers![index].selected!) {
                                      controller.selectedIdTeacher.add(
                                          controller.preRequestModel.data!
                                              .teachers![index]);
                                    } else {
                                      controller.selectedIdTeacher.removeWhere(
                                          (element) =>
                                              element.id ==
                                              controller.preRequestModel.data!
                                                  .teachers![index].id!);
                                    }
                                    controller.update();
                                    // await controller.sendRequestData({
                                    //   "task_id": id,
                                    //   "teacher_id": controller
                                    //       .getAllTeachersModel.data![index].id
                                    //       .toString()
                                    // });
                                  },
                                  behavior: HitTestBehavior.opaque,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 3),
                                    decoration: BoxDecoration(
                                        color: controller.preRequestModel.data!
                                                .teachers![index].selected!
                                            ? Styles.orangeYellow
                                            : Colors.transparent,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: CustomTextWidget(
                                      text: controller.preRequestModel.data!
                                              .teachers![index].selected!
                                          ? "Selected"
                                          : "Select",
                                      fontSize: 10,
                                      color: controller.preRequestModel.data!
                                              .teachers![index].selected!
                                          ? Styles.black
                                          : Styles.white,
                                    ),
                                  ),
                                ),
                                // const SizedBox(
                                //   width: 5,
                                // ),
                                // const CustomTextWidget(
                                //   text: "Ignore",
                                //   color: Color(0xffACACAC),
                                // )
                              ],
                            );
                          }),
                    ),
              GestureDetector(
                onTap: () => Get.to(() => const PreviewTaskDetail()),
                child: Container(
                  height: 55,
                  decoration: const BoxDecoration(color: Styles.orangeYellow),
                  width: Get.width,
                  alignment: Alignment.center,
                  child: const CustomTextWidget(
                    text: "Continue",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
