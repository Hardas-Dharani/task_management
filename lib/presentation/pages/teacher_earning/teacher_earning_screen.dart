import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_text_component.dart';

import '../../../../components/custom_appbar_component.dart';
import '../../../../components/main_scaffold_component.dart';
import '../../../../utils/styles.dart';
import 'controller/teacher_earning_controller.dart';

class TeacherEarningScreen extends GetView<TeacherEarningController> {
  const TeacherEarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      backgroundColor: Styles.black,
      // bottomNavigationBar: const SizedBox(),
      appBar: CustomAppBar(
        bgColor: Styles.black,
        backButtonColor: Colors.white,
        title: "My Earnings",
        titleColor: Styles.white,
        leading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<TeacherEarningController>(builder: (_) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: controller.earningTeacherData.data != null
                  ? Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Styles.orangeYellow),
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextWidget(
                            text: "My Total Earning",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextWidget(
                            text:
                                controller.earningTeacherData.data?.earnings ??
                                    "",
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            );
          })
        ],
      ),
    );
  }
}
