import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_text_component.dart';

import '../../../../components/custom_appbar_component.dart';
import '../../../../components/main_scaffold_component.dart';
import '../../../../utils/styles.dart';
import '../controller/create_task_controller.dart';

class BankDetailScreen extends GetView<CreateTaskController> {
  const BankDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      backgroundColor: Styles.black,
      // bottomNavigationBar: const SizedBox(),
      appBar: CustomAppBar(
        bgColor: Styles.black,
        backButtonColor: Colors.white,
        title: "Payment Method",
        titleColor: Styles.white,
        leading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              decoration: const BoxDecoration(color: Styles.orangeYellow),
              width: Get.width,
              child: const CustomTextWidget(
                text: "Bank Details",
                color: Styles.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return selectedBank();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget selectedBank() {
    return Row(
      children: [
        Image.asset(
          "assets/images/bank_screen.png",
          height: 45,
          width: 45,
        ),
        const SizedBox(
          width: 10,
        ),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomTextWidget(
                    text: "Account Title: ",
                    color: Styles.white,
                    fontSize: 16,
                  ),
                  CustomTextWidget(
                    text: "fdsjnfkjasdnf",
                    fontSize: 14,
                    color: Color(0xffB5B5B5),
                  ),
                ],
              ),
              Row(
                children: [
                  CustomTextWidget(
                    text: "Account No: ",
                    color: Styles.white,
                    fontSize: 16,
                  ),
                  CustomTextWidget(
                    text: "fdsjnfkjasdnf",
                    fontSize: 14,
                    color: Color(0xffB5B5B5),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
