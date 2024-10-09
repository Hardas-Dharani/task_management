import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_text_component.dart';

import '../../../../utils/styles.dart';
import '../../../app/services/local_storage.dart';
import '../../../data/models/task_detail_model.dart';
import '../../../data/models/user_firebase.dart';
import '../../../routes/app_routes.dart';
import '../chat/widget/message.dart';
import 'controller/task_detail_controller.dart';
import 'widget/revisions_screen.dart';

class RevisionTab extends GetView<TaskDetailController> {
  const RevisionTab({super.key});
//  floatingActionButton:
//           Get.find<LocalStorageService>().loginModel!.data!.user!.roleId != 2
//               ? FloatingActionButton(
//                   backgroundColor: Styles.orangeYellow,
//                   onPressed: () {
//                     Get.offAndToNamed(Routes.revisionCreate, arguments: {
//                       "taskDetail": controller.taskDetailModel.data!.task
//                     });
//                   },
//                   child: const Icon(Icons.add),
//                 )
//               : const SizedBox.shrink(),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          Get.find<LocalStorageService>().loginModel!.data!.user!.roleId != 2
              ? controller.isCompletedTask
                  ? const SizedBox.shrink()
                  : FloatingActionButton(
                      backgroundColor: Styles.orangeYellow,
                      onPressed: () {
                        Get.offAndToNamed(Routes.revisionCreate, arguments: {
                          "taskDetail": controller.taskDetailModel.data!.task
                        });
                      },
                      child: const Icon(Icons.add),
                    )
              : const SizedBox.shrink(),
      backgroundColor: Styles.black,
      body: GetBuilder<TaskDetailController>(builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (controller.revisionListModel.data != null) {
                        Get.to(RevisionsScreen(
                          id: controller
                              .revisionListModel.data!.revisions![index].id,
                        ));
                      }
                    },
                    child: controller.revisionListModel.data == null
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Styles.black,
                                  border:
                                      Border.all(color: Styles.orangeYellow),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 17),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextWidget(
                                    text: controller.revisionListModel.data!
                                            .revisions![index].subject ??
                                        "",
                                    fontSize: 15,
                                    color: Styles.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextWidget(
                                    text: controller.revisionListModel.data!
                                            .revisions![index].description ??
                                        "",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Styles.white.withOpacity(.6),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      controller.revisionListModel.data!
                                              .revisions![index].files!.isEmpty
                                          ? const SizedBox.shrink()
                                          : CustomTextWidget(
                                              text:
                                                  "${controller.revisionListModel.data!.revisions![index].files!.length} Files",
                                              color: Styles.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      CustomTextWidget(
                                        text: Styles().formatRelativeTime(
                                            controller.revisionListModel.data!
                                                .revisions![index].createdAt!),
                                        color: Styles.orangeYellow,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: controller.revisionListModel.data!.revisions!.length)
          ],
        );
      }),
    );
  }
}

class TaskDetailScreen extends GetView<TaskDetailController> {
  const TaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Styles.black,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 45, 27, 27),
          title: const CustomTextWidget(
            text: 'Task Detail',
            color: Styles.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Styles.white,
              )),
          bottom: TabBar(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            labelColor: Styles.orangeYellow,
            indicatorColor: Styles.orangeYellow,
            dividerColor: Styles.white.withOpacity(.30),
            unselectedLabelColor: Styles.white.withOpacity(.30),
            tabs: const [
              Tab(text: 'Task'),
              Tab(text: 'Revision'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TaskTab(),
            RevisionTab(),
          ],
        ),
      ),
    );
  }
}

class TaskTab extends GetView<TaskDetailController> {
  const TaskTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                        titleAndSubTitle("Enter your project title",
                            controller.taskDetailModel.data!.task!.title ?? ""),
                        titleAndSubTitle(
                            "What needs to be done?",
                            controller
                                    .taskDetailModel.data!.task!.description ??
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
                        const SizedBox(
                          height: 10,
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
                            Styles().StringConvertDateTime(controller
                                .taskDetailModel.data!.task!.deadline!)),
                        titleAndSubTitle(
                            "Type of assignment",
                            controller
                                    .taskDetailModel.data!.task!.type!.title ??
                                ""),
                        Get.find<LocalStorageService>()
                                    .loginModel!
                                    .data!
                                    .user!
                                    .roleId !=
                                2
                            ? controller.taskDetailModel.data!.task!.typeId != 1
                                ? const SizedBox.shrink()
                                : titleAndSubTitle(
                                    "How many words?",
                                    controller
                                        .taskDetailModel.data!.task!.wordCount)
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
                            : controller.taskDetailModel.data!.task!.fee == null
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
                            : controller.taskDetailModel.data!.task!.fee == null
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
                            : controller.taskDetailModel.data!.task!.fee == null
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
                            : controller.taskDetailModel.data!.task!.teacher ==
                                    null
                                ? const Row(
                                    children: [
                                      CustomTextWidget(
                                        text: "Select any Teacher:",
                                        color: Styles.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      )
                                    ],
                                  )
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
                            : controller.taskDetailModel.data!.task!.teacher !=
                                    null
                                ? selectedTeacherFinal(controller
                                    .taskDetailModel.data!.task!.teacher!)
                                : controller.taskDetailModel.data!.task!.teachers
                                            ?.isEmpty ==
                                        null
                                    ? const SizedBox.shrink()
                                    : ListView.separated(
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            selectedTeacher(
                                                controller.taskDetailModel.data!
                                                    .task!.teachers![index],
                                                controller.taskDetailModel.data!
                                                        .task!.paymentStatus ==
                                                    "approved"),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              height: 10,
                                            ),
                                        itemCount: controller.taskDetailModel
                                                .data!.task!.teachers?.length ??
                                            0),
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
    );
  }

  Widget selectedTeacher(TeachersData teachers, bool paymentDone) {
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
                text: teachers.teacher?.name ?? "",
                color: Styles.white,
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  if (paymentDone) {
                    controller.accpetTeacher({
                      "task_id": teachers.taskId.toString(),
                      "teacher_id": teachers.teacherId.toString()
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: const Color(0xff858585))),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                  child: const CustomTextWidget(
                    text: "Select",
                    decoration: TextDecoration.underline,

                    // text: teachers.name ?? "",
                    color: Styles.orange,
                  ),
                ),
              ),

              // CustomTextWidget(
              //   text: teachers.gender ?? '',
              //   color: Styles.white,
              //   fontSize: 9,
              // )
            ],
          ),
        ),
        paymentDone
            ? IconButton(
                onPressed: () {
                  UserFireBaseModel userFireBaseModel = UserFireBaseModel(
                      id: teachers.teacherId.toString(),
                      name: teachers.teacher?.name ?? "",
                      isOnline: true,
                      profilePictureUrl:
                          "https://cdn-icons-png.flaticon.com/512/6185/6185659.png",
                      lastSeen: {});
                  Get.to(() => MessageWidgetScreen(
                      userFireBaseModel: userFireBaseModel));
                },
                icon: Icon(Icons.messenger))
            : SizedBox.shrink()
      ],
    );
  }

  Widget selectedTeacherFinal(Student teachers) {
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
              const SizedBox(
                height: 15,
              ),
              CustomTextWidget(
                text: teachers.gender ?? '',
                color: Styles.white,
                fontSize: 9,
              )
            ],
          ),
        ),
        IconButton(
            onPressed: () {
              UserFireBaseModel userFireBaseModel = UserFireBaseModel(
                  id: teachers.id.toString(),
                  name: teachers.name.toString(),
                  isOnline: true,
                  profilePictureUrl:
                      "https://cdn-icons-png.flaticon.com/512/6185/6185659.png",
                  lastSeen: {});
              Get.to(() =>
                  MessageWidgetScreen(userFireBaseModel: userFireBaseModel));
            },
            icon: Icon(Icons.messenger))
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



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:task_management/components/custom_appbar_component.dart';
// import 'package:task_management/components/custom_button_component.dart';
// import 'package:task_management/components/custom_text_component.dart';
// import 'package:task_management/routes/app_routes.dart';
// import 'package:task_management/utils/styles.dart';

// import '../../../components/main_scaffold_component.dart';
// import '../home/widget/drawer_bar.dart';
// import 'controller/task_detail_controller.dart';

// class TaskDetailScreen extends GetView<TaskDetailController> {
//   const TaskDetailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MainScaffold(
//       backgroundColor: Styles.black,
//       keyGlobal: controller.globalKey,
//       drawarBar: const CustomDrawer(),
//       appBar: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: CustomAppBar(
//           bgColor: Styles.black,
//           title: "Project Details",
//           titleColor: Styles.white,
//           trailing: IconButton(
//               onPressed: () {
//                 Get.toNamed(Routes.chats);
//               },
//               icon: Image.asset(
//                 "assets/images/icons/menu_icon.png",
//                 width: 20,
//                 color: Styles.white,
//                 height: 20,
//               )),
//           leading: true,
//         ),
//       ),
//       body: GetBuilder<TaskDetailController>(
//         init: TaskDetailController(),
//         builder: (_) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             child: SizedBox(
//               height: Get.height,
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     CustomTextWidget(
//                       text: controller.taskListModelData.title ?? "",
//                       fontSize: 16,
//                       color: Styles.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     const SizedBox(
//                       height: 8,
//                     ),

//                     CustomTextWidget(
//                       text:
//                           "Posted ${Styles().formatRelativeTime(controller.taskListModelData.createdAt!)}",
//                       fontSize: 12,
//                       color: Styles.white,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     const Divider(),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     const Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         // Column(
//                         //   crossAxisAlignment: CrossAxisAlignment.start,
//                         //   children: [
//                         //     CustomTextWidget(
//                         //       text: controller.taskListModelData.budget ?? "",
//                         //       fontSize: 16,
//                         //       color: Styles.orangeYellow,
//                         //       fontWeight: FontWeight.bold,
//                         //     ),
//                         //     const SizedBox(
//                         //       height: 3,
//                         //     ),
//                         //     const CustomTextWidget(
//                         //       text: "Fixed Price",
//                         //       fontSize: 10,
//                         //       color: Styles.white,
//                         //       fontWeight: FontWeight.w400,
//                         //     ),
//                         //   ],
//                         // ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CustomTextWidget(
//                               text: "Entry Level",
//                               fontSize: 16,
//                               color: Styles.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             SizedBox(
//                               height: 3,
//                             ),
//                             CustomTextWidget(
//                               text: "Experience Level",
//                               fontSize: 10,
//                               color: Styles.white,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     const Divider(),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     CustomTextWidget(
//                       text: controller.taskListModelData.description ?? "",
//                       fontSize: 12,
//                       color: Styles.white,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     // const Divider(),
//                     // const SizedBox(
//                     //   height: 20,
//                     // ),
//                     // const CustomTextWidget(
//                     //   text: "Skills & Expertise",
//                     //   fontSize: 16,
//                     //   fontWeight: FontWeight.bold,
//                     // ),
//                     // Wrap(
//                     //   spacing: 10,
//                     //   children: controller.sortList.map((skill) {
//                     //     return Chip(
//                     //       backgroundColor: Styles.orangeYellow.withOpacity(0.2),
//                     //       label: CustomTextWidget(
//                     //         text: skill,
//                     //         color: Styles.black,
//                     //         fontWeight: FontWeight.w400,
//                     //       ),
//                     //     );
//                     //   }).toList(),
//                     // ),

//                     const Divider(),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     const CustomTextWidget(
//                       text: "About the client",
//                       fontSize: 16,
//                       color: Styles.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       children: [
//                         Image.asset(
//                           "assets/images/icons/verify_icon.png",
//                           width: 15,
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         const CustomTextWidget(
//                           text: "Payment Varified",
//                           fontSize: 12,
//                           color: Styles.white,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 50,
//                     ),
//                     CustomButton(
//                       bgColor: Styles.orangeYellow,
//                       onTap: () {
//                         Get.toNamed(Routes.submitProposal, arguments: {
//                           "taskDetail": controller.taskListModelData
//                         });
//                       },
//                       width: Get.width,
//                       title: "Apply Now",
//                       fontColor: Styles.white,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
