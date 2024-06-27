import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_appbar_component.dart';
import 'package:task_management/routes/app_routes.dart';
import 'package:task_management/utils/styles.dart';

import '../../../components/main_scaffold_component.dart';
import 'controller/teacher_home_controller.dart';
import 'widget/custom_task.dart';
import 'widget/drawer_bar.dart';

class TeacherHomeScreen extends GetView<TeacherHomeController> {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      backgroundColor: Styles.black,
      keyGlobal: controller.globalKey,
      drawarBar: const CustomDrawerTeacher(),
      appBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomAppBar(
          title: "Home",
          titleColor: Styles.white,
          bgColor: Styles.black,
          // trailing: IconButton(
          //     onPressed: () {
          //       Get.toNamed(Routes.requestDetail);
          //     },
          //     icon: const Icon(
          //       Icons.person_add_alt,
          //       color: Styles.white,
          //     )
          //     //  Image.asset(
          //     //   "assets/images/icons/menu_icon.png",
          //     //   width: 20,
          //     //   height: 20,
          //     //   color: Styles.white,
          //     // )
          //     ),
          leadingWidget: GestureDetector(
            onTap: () {
              controller.globalKey.currentState!.openDrawer();
            },
            child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.asset("assets/images/person_image.png")),
          ),
        ),
      ),
      body: GetBuilder<TeacherHomeController>(
        init: TeacherHomeController(),
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: Get.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                        shrinkWrap: true,
                        // padding: const EdgeInsets.only(left: 20, top: 0),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.selectedList =
                                  controller.sortList[index];
                              controller.update();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                      color: controller.selectedList ==
                                              controller.sortList[index]
                                          ? Colors.transparent
                                          : const Color(0xff858585)),
                                  color: controller.selectedList ==
                                          controller.sortList[index]
                                      ? Styles.orangeYellow
                                      : Colors.transparent),
                              child: Text(
                                controller.sortList[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: controller.selectedList ==
                                            controller.sortList[index]
                                        ? Styles.black
                                        : const Color(0xff858585)),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 10,
                            ),
                        itemCount: controller.sortList.length),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: controller.mostRecentTaskModel.data == null
                        ? const SizedBox()
                        : ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.taskDetail, arguments: {
                                    "taskDetail": controller
                                        .mostRecentTaskModel.data![index]
                                  });
                                },
                                child: CustomTaskWidget(
                                  taskModel: controller
                                      .mostRecentTaskModel.data![index],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 20,
                            ),
                            itemCount:
                                controller.mostRecentTaskModel.data!.length,
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
