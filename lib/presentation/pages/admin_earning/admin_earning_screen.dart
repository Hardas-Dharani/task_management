import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_text_component.dart';

import '../../../../components/custom_appbar_component.dart';
import '../../../../components/main_scaffold_component.dart';
import '../../../../utils/styles.dart';
import 'controller/admin_earning_controller.dart';

class AdminEarningScreen extends GetView<AdminEarningController> {
  const AdminEarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      backgroundColor: Styles.black,
      // bottomNavigationBar: const SizedBox(),
      appBar: CustomAppBar(
        bgColor: Styles.black,
        backButtonColor: Colors.white,
        title: "Teachers Earnings",
        titleColor: Styles.white,
        leading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<AdminEarningController>(builder: (_) {
            return Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: controller.earningTeacherData.data != null
                    ? ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 15,
                        ),
                        shrinkWrap: true,
                        itemCount: controller
                            .earningTeacherData.data!.teachers!.length,
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                            collapsedIconColor: Styles.orangeActive,
                            expandedCrossAxisAlignment:
                                CrossAxisAlignment.start,
                            leading: CustomTextWidget(
                              text: controller.earningTeacherData.data!
                                      .teachers![index].teacher?.name ??
                                  "",
                              color: Styles.white,
                            ),
                            title: CustomTextWidget(
                              text: "",
                              color: Styles.white,
                            ),
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const CustomTextWidget(
                                    text: "Total Earning",
                                    color: Styles.white,
                                  ),
                                  CustomTextWidget(
                                    text: controller.earningTeacherData.data!
                                            .teachers![index].totalEarnings ??
                                        "",
                                    color: Styles.white,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const CustomTextWidget(
                                    text: "Net Earning",
                                    color: Styles.white,
                                  ),
                                  CustomTextWidget(
                                    text: controller.earningTeacherData.data!
                                            .teachers![index].netEarnings ??
                                        "",
                                    color: Styles.white,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              ),
            );
          })
        ],
      ),
    );
  }
}
