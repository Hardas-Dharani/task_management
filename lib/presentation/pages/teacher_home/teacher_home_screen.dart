import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_appbar_component.dart';
import 'package:task_management/components/custom_text_component.dart';
import 'package:task_management/routes/app_routes.dart';
import 'package:task_management/utils/styles.dart';

import '../../../app/services/local_storage.dart';
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
          title: "Projects",
          titleColor: Styles.white,
          bgColor: Styles.black,
          trailing: IconButton(
              onPressed: () {
                Get.toNamed(Routes.requestDetail);
              },
              icon: const Icon(
                Icons.person_add_alt,
                color: Styles.white,
              )
              //  Image.asset(
              //   "assets/images/icons/menu_icon.png",
              //   width: 20,
              //   height: 20,
              //   color: Styles.white,
              // )
              ),
          leadingWidget: GestureDetector(
            onTap: () {
              controller.globalKey.currentState!.openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(Get.find<LocalStorageService>()
                        .loginModel!
                        .user!
                        .imageUrl ??
                    "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg"),
              ),
            ),
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
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextWidget(
                      text: 'Most Recent',
                      fontWeight: controller.selectedIndex == 1
                          ? FontWeight.w700
                          : FontWeight.w400,
                      fontSize: 16,
                      color: Styles.orangeYellow),
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
