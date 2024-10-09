import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_appbar_component.dart';
import 'package:task_management/presentation/pages/admin_home/widget/task_tab.dart';
import 'package:task_management/routes/app_routes.dart';
import 'package:task_management/utils/styles.dart';

import '../../../components/main_scaffold_component.dart';
import 'controller/admin_home_controller.dart';
import 'widget/drawer_bar.dart';
import 'widget/task_detail_tab.dart';

class AdminHomeScreen extends GetView<AdminHomeController> {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: MainScaffold(
        backgroundColor: Styles.black,
        keyGlobal: controller.globalKey,
        drawarBar: const CustomDrawerTeacher(),
        appBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomAppBar(
            title: "Home",
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
                  child: Image.asset("assets/images/person_image.png")),
            ),
          ),
        ),
        body: GetBuilder<AdminHomeController>(
          init: AdminHomeController(),
          builder: (_) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: Get.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      labelColor: Styles.orangeYellow,
                      indicatorColor: Styles.orangeYellow,
                      dividerColor: Styles.white.withOpacity(.30),
                      unselectedLabelColor: Styles.white.withOpacity(.30),
                      tabs: const [
                        Tab(text: 'Payment Review'),
                        Tab(text: 'Quotation Requirement'),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          PaymentReview(),
                          QuotationView(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PaymentReview extends GetView<AdminHomeController> {
  const PaymentReview({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminHomeController>(builder: (_) {
      return Column(
        children: [
          controller.paymentModel.data == null
              ? const SizedBox()
              : Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ContainerTaskTab(
                          onTap: () {
                            Get.toNamed(Routes.paymentProofAdmin, arguments: {
                              "image": controller.paymentModel.data!
                                  .tasks![index].payment!.source!,
                              "taskID":
                                  controller.paymentModel.data!.tasks![index].id
                            });

                            // Get.to(() => PaymentScreenAdminDetail(
                            //       image: controller.paymentModel.data!
                            //           .tasks![index].payment!.source!,
                            //     ));
                          },
                          taskData: controller.paymentModel.data!.tasks![index],
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: controller.paymentModel.data!.tasks!.length),
                )
        ],
      );
    });
  }
}

class QuotationView extends GetView<AdminHomeController> {
  const QuotationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        controller.quotationModel.data == null
            ? const SizedBox()
            : Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ContainerTaskTab(
                        onTap: () {
                          Get.put(AdminHomeController);

                          Get.to(() => TaskTab(
                                id: controller
                                    .quotationModel.data!.tasks![index].id,
                              ));
                        },
                        taskData: controller.quotationModel.data!.tasks![index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                    itemCount: controller.quotationModel.data!.tasks!.length),
              )
      ],
    );
  }
}
