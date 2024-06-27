import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_appbar_component.dart';
import 'package:task_management/components/custom_text_component.dart';
import 'package:task_management/utils/styles.dart';

import '../../../../components/main_scaffold_component.dart';
import '../controller/home_controller.dart';

class SharePropsalListDetailScreen extends GetView<HomeController> {
  final String? id;
  const SharePropsalListDetailScreen({super.key, this.id});
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      backgroundColor: Styles.black,
      // drawarBar: const CustomDrawer(),
      appBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomAppBar(
          bgColor: Styles.black,
          title: "Proposal Requests",
          titleColor: Styles.white,
          // trailing: IconButton(
          //     onPressed: () {
          //       Get.toNamed(Routes.chats);
          //     },
          //     icon: Image.asset(
          //       "assets/images/icons/menu_icon.png",
          //       width: 20,
          //       color: Styles.white,
          //       height: 20,
          //     )),
          leading: true,
        ),
      ),
      body: GetBuilder<HomeController>(
        initState: (state) {
          controller.getAllPropsal(id!);
        },
        builder: (_) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  controller.getListPropsalModel.data == null
                      ? const SizedBox()
                      : ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          shrinkWrap: true,
                          itemCount:
                              controller.getListPropsalModel.data!.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextWidget(
                                        text: controller.getListPropsalModel
                                                .data![index].amount ??
                                            "",
                                        color: Styles.white,
                                        fontSize: 14,
                                      ),
                                      CustomTextWidget(
                                        text: controller.getListPropsalModel
                                                .data![index].task!.title ??
                                            "",
                                        color: Styles.white,
                                        fontSize: 10,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    // await controller.sendRequestData({
                                    //   "proposal_id": controller
                                    //       .getListPropsalModel.data![index].id
                                    //       .toString(),
                                    //   "task_id": controller.getListPropsalModel
                                    //       .data![index].taskId
                                    //       .toString()
                                    // }, "proposal/accept",
                                    //     user: controller.getListPropsalModel
                                    //         .data![index].user);
                                  },
                                  behavior: HitTestBehavior.opaque,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 3),
                                    decoration: const BoxDecoration(
                                        color: Styles.orangeYellow,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: const CustomTextWidget(
                                      text: "Accpet",
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    // await controller.sendRequestData({
                                    //   "proposal_id": controller
                                    //       .getListPropsalModel.data![index].id
                                    //       .toString(),
                                    // }, "proposal/deny");
                                  },
                                  behavior: HitTestBehavior.opaque,
                                  child: const CustomTextWidget(
                                    text: "Ignore",
                                    color: Color(0xffACACAC),
                                  ),
                                )
                              ],
                            );
                          })
                ],
              ));
        },
      ),
    );
  }
}
