import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_appbar_component.dart';
import 'package:task_management/components/custom_button_component.dart';
import 'package:task_management/presentation/pages/home/widget/container_tab.dart';
import 'package:task_management/routes/app_routes.dart';
import 'package:task_management/utils/styles.dart';

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
          title: "Home",
          bgColor: Styles.black,
          titleColor: Styles.white,
          trailing: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Styles.orangeYellow,
              borderRadius: BorderRadius.circular(5),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Get.toNamed(Routes.createTask);
              },
              child: const Icon(
                Icons.add,
                color: Styles.black,
              ),
            ),
          ),
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

                          CustomButton(
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
                  const SizedBox(
                    height: 30,
                  ),
                  controller.taskModel.data == null
                      ? const SizedBox()
                      : Expanded(
                          child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ContainerTabTask(
                                  taskData: controller.taskModel.data![index],
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
