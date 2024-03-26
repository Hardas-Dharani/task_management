import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_appbar_component.dart';
import 'package:task_management/components/custom_button_component.dart';
import 'package:task_management/components/custom_text_component.dart';
import 'package:task_management/routes/app_routes.dart';
import 'package:task_management/utils/styles.dart';

import '../../../app/services/local_storage.dart';
import '../../../components/main_scaffold_component.dart';
import 'controller/home_controller.dart';
import 'widget/drawer_bar.dart';

class CarouselItem {
  final String imageUrl;

  CarouselItem(this.imageUrl);
}

class HomeScreen extends GetView<HomeController> {
  final List<CarouselItem> itemsCarousel = [
    CarouselItem('carousel_1.png'),
    CarouselItem('carousel_2.png'),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      backgroundColor: Styles.black,
      floatActiveButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.createTask);
        },
        child: const Icon(Icons.add),
      ),
      keyGlobal: controller.globalKey,
      drawarBar: const CustomDrawer(),
      appBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomAppBar(
          title: "My Project",
          bgColor: Styles.black,
          titleColor: Styles.white,
          trailing: IconButton(
              onPressed: () {
                Get.toNamed(Routes.chats);
              },
              icon: Image.asset(
                "assets/images/icons/chat_icon.png",
                width: 25,
                height: 25,
                color: Styles.white,
              )),
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
      body: GetBuilder<HomeController>(
        init: HomeController(),
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
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                        shrinkWrap: true,
                        // padding: const EdgeInsets.only(left: 20, top: 0),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CustomButton(
                            onTap: () {
                              controller.selectedList =
                                  controller.sortList[index];
                              controller.update();
                            },
                            width: 90,
                            bgColor: controller.selectedList ==
                                    controller.sortList[index]
                                ? Styles.orangeYellow
                                : Styles.white,
                            borderColor: controller.selectedList ==
                                    controller.sortList[index]
                                ? Styles.white
                                : Styles.orangeYellow.withOpacity(0.4),
                            title: controller.sortList[index],
                            fontSize: 10,
                            fontColor: controller.selectedList ==
                                    controller.sortList[index]
                                ? Styles.black
                                : Styles.orangeYellow,
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
                  controller.taskModel.data == null
                      ? const SizedBox()
                      : Expanded(
                          child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return controller.selectedList ==
                                            "In Progress" &&
                                        controller.taskModel.data![index]
                                                .isProgress ==
                                            0
                                    ? const SizedBox()
                                    : controller.selectedList == "Complete" &&
                                            controller.taskModel.data![index]
                                                    .isCompleted ==
                                                0
                                        ? const SizedBox()
                                        : controller.selectedList ==
                                                    "Deleted" &&
                                                controller
                                                        .taskModel
                                                        .data![index]
                                                        .isDeleted ==
                                                    0
                                            ? const SizedBox()
                                            : Container(
                                                height: 220,
                                                padding:
                                                    const EdgeInsets.all(18),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Styles
                                                            .orangeYellow)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        CustomTextWidget(
                                                          text: controller
                                                                  .taskModel
                                                                  .data![index]
                                                                  .title ??
                                                              "",
                                                          fontSize: 16,
                                                          color: Styles.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        const Spacer(),
                                                        // IconButton(
                                                        //     padding: EdgeInsets.zero,
                                                        //     onPressed: () {},
                                                        //     // alignment: Alignment.centerRight,
                                                        //     icon: const Icon(
                                                        //       Icons.edit,
                                                        //       color: Styles.orangeYellow,
                                                        //       size: 20,
                                                        //     )),
                                                        IconButton(
                                                            onPressed: () {
                                                              controller.deleteTask(
                                                                  controller
                                                                      .taskModel
                                                                      .data![
                                                                          index]
                                                                      .id
                                                                      .toString());
                                                            },
                                                            padding:
                                                                EdgeInsets.zero,
                                                            // alignment: Alignment.centerRight,
                                                            icon: const Icon(
                                                              Icons.delete,
                                                              color: Styles
                                                                  .orangeYellow,
                                                              size: 20,
                                                            ))
                                                      ],
                                                    ),
                                                    CustomTextWidget(
                                                      text: Styles()
                                                          .formatRelativeTime(
                                                              controller
                                                                  .taskModel
                                                                  .data![index]
                                                                  .createdAt!),
                                                      fontSize: 12,
                                                      color: Styles.white,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const Row(
                                                      children: [
                                                        // RichTextWidget(
                                                        //   text:
                                                        //       "${controller.taskModel.data![index].budget} ",
                                                        //   textFontSize: 16,
                                                        //   textFontWeight:
                                                        //       FontWeight.bold,
                                                        //   color: Styles
                                                        //       .orangeYellow,
                                                        //   onTapColor:
                                                        //       Styles.black,
                                                        //   onTapText: " Price",
                                                        //   onTapFontSize: 12,
                                                        // ),
                                                        Spacer(),
                                                        // Image.asset(
                                                        //   "assets/images/icons/verify_icon.png",
                                                        //   width: 15,
                                                        // ),
                                                        // const SizedBox(
                                                        //   width: 10,
                                                        // ),
                                                        // const CustomTextWidget(
                                                        //   text: "Payment Varified",
                                                        //   fontSize: 12,
                                                        //   fontWeight: FontWeight.w500,
                                                        // ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Divider(
                                                      color: Styles.orangeYellow
                                                          .withOpacity(0.5),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Expanded(
                                                      child: CustomTextWidget(
                                                        text: controller
                                                            .taskModel
                                                            .data![index]
                                                            .description
                                                            .toString(),
                                                        fontSize: 12,
                                                        color: Styles.white,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 20,
                                  ),
                              itemCount: controller.taskModel.data!.length),
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
