import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/app/services/local_storage.dart';

import '../../../components/custom_appbar_component.dart';
import '../../../components/custom_text_component.dart';
import '../../../components/main_scaffold_component.dart';
import '../../../data/models/education_model.dart';
import '../../../data/models/emploment_model.dart';
import '../../../utils/styles.dart';
import 'controller/teacher_profile_controller.dart';

class TeacherProfileScreen extends GetView<TeacherProfileController> {
  const TeacherProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      backgroundColor: Styles.black,
      appBar: CustomAppBar(
        bgColor: Colors.transparent,
        centerTitle: true,
        backButtonColor: Styles.black,
        title: "Profile",
        titleColor: Styles.white,
        leading: true,
        onLeadingPress: () {
          Get.back();
        },
      ),
      body: GetBuilder<TeacherProfileController>(
        init: TeacherProfileController(),
        initState: (v) {
          // WidgetsBinding.instance.addPostFrameCallback((_) {});
        },
        builder: (_) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Container(
              color: Colors.transparent,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 38),
                      Row(
                        children: [
                          badges.Badge(
                            onTap: () {
                              showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Select an Image'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.photo,
                                              size: 20,
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                controller.galleryPick();
                                              },
                                              child: const Text(
                                                'Gallery',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.camera_alt,
                                              size: 20,
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                controller.camPick();
                                              },
                                              child: const Text(
                                                'Camera',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // actions: [
                                    //
                                    // ],
                                  );
                                },
                              );
                            },
                            position: badges.BadgePosition.topStart(
                                start: -8, top: 0),
                            badgeContent: const Icon(
                              Icons.edit,
                              color: Styles.orangeYellow,
                              size: 10,
                            ),
                            badgeStyle: badges.BadgeStyle(
                              shape: badges.BadgeShape.square,
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Styles.orangeYellow, width: 0.5),
                              badgeColor: Colors.transparent,
                              padding: const EdgeInsets.all(8),
                            ),
                            child: Container(
                              width: 85,
                              height: 85,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(Get.find<
                                                  LocalStorageService>()
                                              .loginModel!
                                              .data!
                                              .user!
                                              .imageUrl ??
                                          "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg"))),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                text: Get.find<LocalStorageService>()
                                        .loginModel!
                                        .data!
                                        .user!
                                        .name ??
                                    "",
                                fontWeight: FontWeight.w600,
                                color: Styles.white,
                                fontSize: 24,
                              ),
                              CustomTextWidget(
                                text: Get.find<LocalStorageService>()
                                        .loginModel!
                                        .data!
                                        .user!
                                        .email ??
                                    "",
                                fontWeight: FontWeight.normal,
                                color: Styles.white,
                                fontSize: 12,
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget education(EducationModelData? educationModelData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextWidget(
              text: educationModelData!.schoolName ?? "",
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              width: 20,
            ),
            // Container(
            //   padding: const EdgeInsets.all(3),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(5),
            //       border: Border.all(color: Styles.orangeYellow)),
            //   child: const Icon(
            //     Icons.edit,
            //     size: 14,
            //     color: Styles.orangeYellow,
            //   ),
            // ),
            // const SizedBox(
            //   width: 10,
            // ),
            GestureDetector(
              onTap: () {
                controller.deleteTask(
                    educationModelData.id.toString(), "education");
              },
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Styles.orangeYellow)),
                child: const Icon(
                  Icons.delete,
                  size: 14,
                  color: Styles.orangeYellow,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 3,
        ),
        CustomTextWidget(text: educationModelData.degree ?? ""),
        const SizedBox(
          height: 3,
        ),
        CustomTextWidget(
            text:
                "${educationModelData.startDate ?? ""}- ${educationModelData.endDate ?? ""}"),
      ],
    );
  }

  Widget employment(EmploymentModelData employmentModelData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextWidget(
              text: employmentModelData.designation.toString(),
              fontSize: 12,
              color: Styles.white,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                controller.deleteTask(
                    employmentModelData.id.toString(), "employement");
              },
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Styles.orangeYellow)),
                child: const Icon(
                  Icons.edit,
                  size: 14,
                  color: Styles.orangeYellow,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Styles.orangeYellow)),
              child: const Icon(
                Icons.delete,
                size: 14,
                color: Styles.orangeYellow,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 3,
        ),
        CustomTextWidget(
          text:
              "${employmentModelData.startDate} - ${employmentModelData.endDate} ",
          color: Styles.white,
        ),
      ],
    );
  }
}
