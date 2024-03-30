import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_text_component.dart';

import '../../../components/main_scaffold_component.dart';
import '../../../utils/styles.dart';
import 'controller/user_list_controller.dart';
import 'widget/drawer_bar.dart';

class UserListScreen extends GetView<UserListController> {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      key: controller.globalKey,
      backgroundColor: Styles.black,
      // drawarBar: const CustomDrawer(),
      // appBar: CustomAppBar(
      //   bgColor: Styles.black,
      //   title: "Users",
      //   titleColor: Styles.white,
      //   // trailing: IconButton(
      //   //     onPressed: () {
      //   //       Get.toNamed(Routes.chats);
      //   //     },
      //   //     icon: Image.asset(
      //   //       "assets/images/icons/menu_icon.png",
      //   //       width: 20,
      //   //       color: Styles.white,
      //   //       height: 20,
      //   //     )),
      //   leading: false,
      // ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Styles.white),
        // leading: const Icon(Icons.menu,color: Styles.white,),
        backgroundColor: Styles.black,
        title: const CustomTextWidget(
          text: "Users",
          fontSize: 18,
          color: Styles.white,
        ),
      ),
      drawarBar: const CustomAdminDrawer(),
      body: GetBuilder<UserListController>(
        init: UserListController(),
        builder: (_) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                              backgroundImage: NetworkImage(
                                  "https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg"),
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
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.back();
                                  Get.back();
                                  Get.back();
                                },
                                behavior: HitTestBehavior.opaque,
                                child: const Icon(
                                  Icons.menu,
                                  color: Styles.white,
                                )),
                            // const SizedBox(
                            //   width: 5,
                            // ),
                            // const CustomTextWidget(
                            //   text: "Ignore",
                            //   color: Color(0xffACACAC),
                            // )
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
