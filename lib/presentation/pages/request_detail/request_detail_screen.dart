import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_appbar_component.dart';
import 'package:task_management/components/custom_text_component.dart';
import 'package:task_management/utils/styles.dart';

import '../../../components/main_scaffold_component.dart';
import '../home/widget/drawer_bar.dart';
import 'controller/request_detail_controller.dart';

class RequestDetailScreen extends GetView<RequestDetailController> {
  const RequestDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      backgroundColor: Styles.black,
      keyGlobal: controller.globalKey,
      drawarBar: const CustomDrawer(),
      appBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomAppBar(
          bgColor: Styles.black,
          title: "Connection",
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
      body: GetBuilder<RequestDetailController>(
        init: RequestDetailController(),
        builder: (_) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Column(
                children: [
                  ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            const CircleAvatar(
                              radius: 25,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextWidget(
                                    text: "Patrcia",
                                    color: Styles.white,
                                  ),
                                  CustomTextWidget(
                                    text:
                                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                    color: Styles.white,
                                    fontSize: 7,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              decoration: const BoxDecoration(
                                  color: Styles.orangeYellow,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: const CustomTextWidget(
                                text: "Accept",
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const CustomTextWidget(
                              text: "Ignore",
                              color: Color(0xffACACAC),
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
