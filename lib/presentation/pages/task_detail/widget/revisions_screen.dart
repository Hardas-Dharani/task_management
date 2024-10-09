import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_button_component.dart';
import 'package:task_management/components/custom_text_component.dart';
import 'package:task_management/utils/styles.dart';

import '../../../../app/services/local_storage.dart';
import '../controller/task_detail_controller.dart';

class RevisionsScreen extends GetView<TaskDetailController> {
  final int? id;
  const RevisionsScreen({super.key, this.id});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskDetailController>(initState: (state) async {
      await controller.getAllRevisDetail(id.toString());
    }, builder: (_) {
      return Scaffold(
        bottomNavigationBar: Get.find<LocalStorageService>()
                    .loginModel!
                    .data!
                    .user!
                    .roleId !=
                2
            ? const SizedBox.shrink()
            : controller.revisionDetailModel.data == null
                ? const SizedBox.shrink()
                : controller.revisionDetailModel.data!.revision!.approved != 0
                    ? const SizedBox.shrink()
                    : controller.revisionDetailModel.data!.revision!.reply !=
                            null
                        ? const SizedBox.shrink()
                        : controller.isDecline
                            ? const SizedBox.shrink()
                            : Container(
                                height: 90,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 25),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: CustomButton(
                                      onTap: () {
                                        controller.isDecline = true;
                                        controller.update();
                                      },
                                      bgColor: Styles.black,
                                      borderColor: Styles.orangeYellow,
                                      radius: 10,
                                      title: "Decline",
                                      fontColor: Styles.orangeYellow,
                                    )),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                        child: CustomButton(
                                      onTap: () {
                                        controller.isDecline = false;
                                        controller.replyRevision("1");
                                        controller.update();
                                      },
                                      bgColor: Styles.orangeYellow,
                                      radius: 10,
                                      title: "Approve",
                                    ))
                                  ],
                                ),
                              ),
        backgroundColor: Styles.black,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Styles.white,
              )),
          backgroundColor: Styles.black,
          title: const CustomTextWidget(
            text: 'Revisions',
            color: Styles.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        body: controller.revisionDetailModel.data == null
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomTextWidget(
                            text: "Task Details:",
                            color: Styles.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomTextWidget(
                            text: Styles().formatRelativeTime(controller
                                .revisionDetailModel
                                .data!
                                .revision!
                                .updatedAt!),
                            color: Styles.orangeYellow,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomTextWidget(
                        text: "Subject",
                        color: Styles.orangeYellow,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextWidget(
                        text: controller
                                .revisionDetailModel.data!.revision!.subject ??
                            "",
                        color: Styles.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomTextWidget(
                        text: "Description",
                        color: Styles.orangeYellow,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextWidget(
                        text: controller.revisionDetailModel.data!.revision!
                                .description ??
                            "",
                        color: Styles.white.withOpacity(.6),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      controller.revisionDetailModel.data!.revision!.reply ==
                              null
                          ? const SizedBox.shrink()
                          : const CustomTextWidget(
                              text: "Reason For Decline...",
                              color: Styles.orangeYellow,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                      const SizedBox(
                        height: 5,
                      ),
                      controller.revisionDetailModel.data!.revision!.reply ==
                              null
                          ? const SizedBox.shrink()
                          : CustomTextWidget(
                              text: controller.revisionDetailModel.data!
                                      .revision!.reply ??
                                  "",
                              color: Styles.white.withOpacity(.6),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        spacing: 10.0, // gap between adjacent items
                        runSpacing: 10.0, // gap between lines
                        children: List.generate(
                          controller.revisionDetailModel.data!.revision!.files!
                              .length, // number of icons to display
                          (index) => Styles().checkWhichFile(controller
                              .taskDetailModel
                              .data!
                              .task!
                              .files![index]
                              .source!),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      controller.isDecline
                          ? SizedBox(
                              height: 270,
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 10,
                                    bottom: 10,
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        controller.replyRevision("0");
                                      },
                                      child: Image.asset(
                                        "assets/images/send_icon.png",
                                        height: 28,
                                        width: 28,
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: TextField(
                                      minLines: 11,
                                      onChanged: (value) {
                                        controller.reply = value;
                                        controller.update();
                                      },
                                      onEditingComplete: () {
                                        controller.replyRevision("0");
                                      },
                                      style:
                                          const TextStyle(color: Styles.white),
                                      maxLines: 12,
                                      textInputAction: TextInputAction.done,
                                      decoration: const InputDecoration(
                                        // filled: true,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Styles.orangeYellow)),
                                        disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Styles.orangeYellow)),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Styles.orangeYellow)),
                                        contentPadding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 10,
                                          right: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),
                      // const TextField(
                      //   maxLines: 10,
                      //   minLines: 8,
                      //   decoration: InputDecoration(
                      //       suffixIcon: Column(
                      //         mainAxisAlignment: MainAxisAlignment.end,
                      //         children: [
                      //           Icon(Icons.send),
                      //         ],
                      //       ),
                      //       enabledBorder: OutlineInputBorder(
                      //           borderSide: BorderSide(color: Styles.orangeYellow)),
                      //       disabledBorder: OutlineInputBorder(
                      //           borderSide: BorderSide(color: Styles.orangeYellow)),
                      //       border: OutlineInputBorder(
                      //           borderSide: BorderSide(color: Styles.orangeYellow))),
                      // ),
                    ],
                  ),
                ),
              ),
      );
    });
  }
}





//public public, shared with me =shared_me , my task empty ,in progress in_progress ,complete complete
//