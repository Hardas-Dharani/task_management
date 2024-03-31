import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/app/services/local_storage.dart';
import 'package:task_management/routes/app_routes.dart';

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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Get.find<LocalStorageService>()
                                            .loginModel!
                                            .user!
                                            .role ==
                                        null
                                    ? const SizedBox()
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomTextWidget(
                                            text:
                                                Get.find<LocalStorageService>()
                                                        .loginModel!
                                                        .user!
                                                        .role!
                                                        .title ??
                                                    "",
                                            fontSize: 16,
                                            color: Styles.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const CustomTextWidget(
                                            text: "Specializes in",
                                            fontSize: 12,
                                            color: Styles.white,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ],
                                      ),
                                // Container(
                                //   padding: const EdgeInsets.all(3),
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(5),
                                //       border: Border.all(
                                //           color: Styles.orangeYellow)),
                                //   child: const Icon(
                                //     Icons.edit,
                                //     size: 16,
                                //     color: Styles.orangeYellow,
                                //   ),
                                // )
                              ],
                            ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // Row(
                            //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     const CustomTextWidget(
                            //       text: "\$0.00/hr",
                            //       fontSize: 16,
                            //       fontWeight: FontWeight.w600,
                            //     ),
                            //     const SizedBox(
                            //       width: 20,
                            //     ),
                            //     Container(
                            //       padding: const EdgeInsets.all(3),
                            //       decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(5),
                            //           border: Border.all(
                            //               color: Styles.orangeYellow)),
                            //       child: const Icon(
                            //         Icons.edit,
                            //         size: 16,
                            //         color: Styles.orangeYellow,
                            //       ),
                            //     )
                            //   ],
                            // ),

                            Get.find<LocalStorageService>()
                                        .loginModel!
                                        .user!
                                        .aboutMe ==
                                    null
                                ? const SizedBox()
                                : const SizedBox(
                                    height: 20,
                                  ),
                            Get.find<LocalStorageService>()
                                        .loginModel!
                                        .user!
                                        .aboutMe ==
                                    null
                                ? const SizedBox()
                                : Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: CustomTextWidget(
                                          text: Get.find<LocalStorageService>()
                                                  .loginModel!
                                                  .user!
                                                  .aboutMe ??
                                              "",
                                          fontSize: 12,
                                          color: Styles.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Styles.orangeYellow)),
                                        child: const Icon(
                                          Icons.edit,
                                          size: 16,
                                          color: Styles.orangeYellow,
                                        ),
                                      )
                                    ],
                                  ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // Row(
                            //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     const CustomTextWidget(
                            //       text: "Skills",
                            //       fontSize: 16,
                            //       fontWeight: FontWeight.w600,
                            //     ),
                            //     const SizedBox(
                            //       width: 20,
                            //     ),
                            //     Container(
                            //       padding: const EdgeInsets.all(3),
                            //       decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(5),
                            //           border: Border.all(
                            //               color: Styles.orangeYellow)),
                            //       child: const Icon(
                            //         Icons.edit,
                            //         size: 16,
                            //         color: Styles.orangeYellow,
                            //       ),
                            //     )
                            //   ],
                            // ),

                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // Wrap(
                            //   spacing: 10,
                            //   runSpacing: 10,
                            //   children: [
                            //     for (var label in controller.labels)
                            //       Container(
                            //         padding: const EdgeInsets.symmetric(
                            //             horizontal: 8, vertical: 4),
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(20),
                            //           color: const Color(0xffCCDDFF),
                            //         ),
                            //         child: CustomTextWidget(
                            //           text: label,
                            //           color: Styles.black,
                            //         ),
                            //       ),
                            //   ],
                            // ),

                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 20,
                            ),
                            // Row(
                            //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     const CustomTextWidget(
                            //       text: "Language",
                            //       fontSize: 16,
                            //       fontWeight: FontWeight.w600,
                            //     ),
                            //     const SizedBox(
                            //       width: 20,
                            //     ),
                            //     Container(
                            //       padding: const EdgeInsets.all(3),
                            //       decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(5),
                            //           border: Border.all(
                            //               color: Styles.orangeYellow)),
                            //       child: const Icon(
                            //         Icons.add,
                            //         size: 16,
                            //         color: Styles.orangeYellow,
                            //       ),
                            //     ),
                            //     const SizedBox(
                            //       width: 10,
                            //     ),
                            //     Container(
                            //       padding: const EdgeInsets.all(3),
                            //       decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(5),
                            //           border: Border.all(
                            //               color: Styles.orangeYellow)),
                            //       child: const Icon(
                            //         Icons.edit,
                            //         size: 16,
                            //         color: Styles.orangeYellow,
                            //       ),
                            //     )
                            //   ],
                            // ),

                            // const SizedBox(
                            //   height: 6,
                            // ),
                            // RichTextWidget(
                            //   text: "English: ",
                            //   onTapText: "Fluent",
                            //   onTapColor: Styles.black.withOpacity(.4),
                            // ),
                            // const SizedBox(
                            //   height: 6,
                            // ),

                            // const SizedBox(
                            //   height: 20,
                            // ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomTextWidget(
                                  text: "Education",
                                  fontSize: 16,
                                  color: Styles.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.createEducation);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Styles.orangeYellow)),
                                    child: const Icon(
                                      Icons.add,
                                      size: 16,
                                      color: Styles.orangeYellow,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            controller.educationModel.data == null
                                ? const SizedBox()
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        controller.educationModel.data!.length,
                                    itemBuilder: (context, index) {
                                      return education(controller
                                          .educationModel.data![index]);
                                    }),

                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomTextWidget(
                                  text: "Employment History",
                                  fontSize: 16,
                                  color: Styles.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.createEmployment);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Styles.orangeYellow)),
                                    child: const Icon(
                                      Icons.add,
                                      size: 16,
                                      color: Styles.orangeYellow,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            controller.employmentModel.data == null
                                ? const SizedBox()
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        controller.employmentModel.data!.length,
                                    itemBuilder: (context, index) {
                                      return employment(controller
                                          .employmentModel.data![index]);
                                    }),
                          ],
                        ),
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
