import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_text_component.dart';

import '../../../../data/models/pre_request_model.dart';
import '../../../../utils/styles.dart';
import 'controller/task_detail_controller.dart';
import 'widget/revisions_screen.dart';

class RevisionTab extends GetView<TaskDetailController> {
  const RevisionTab({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Get.to(const RevisionsScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Styles.black,
                        border: Border.all(color: Styles.orangeYellow),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 17),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTextWidget(
                          text: "Revisions Detail",
                          fontSize: 15,
                          color: Styles.white,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextWidget(
                          text:
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Styles.white.withOpacity(.6),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextWidget(
                              text: "2 Files",
                              color: Styles.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomTextWidget(
                              text: "01/31/2000",
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
            itemCount: 3)
      ],
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
          backgroundColor: Styles.black,
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
                titleAndSubTitle("Enter your project title", ""),
                titleAndSubTitle("What needs to be done?", ""),
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
                    2, // number of icons to display
                    (index) => const Icon(
                      Icons.star,
                      size: 50.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
                titleAndSubTitle("When should it be done?", ""),
                titleAndSubTitle("Type of assignment", ""),
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
                controller.selectedIdTeacher.isEmpty
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
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.selectedIdTeacher.length,
                  itemBuilder: (context, index) {
                    return selectedTeacher(controller.selectedIdTeacher[index]);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget selectedTeacher(Teachers teachers) {
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
