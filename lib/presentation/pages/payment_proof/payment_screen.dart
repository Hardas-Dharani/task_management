import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_button_component.dart';
import 'package:task_management/components/custom_text_component.dart';

import '../../../components/custom_appbar_component.dart';
import '../../../components/main_scaffold_component.dart';
import '../../../utils/styles.dart';
import 'controller/payment_proof_controller.dart';

class PaymentScreenDetail extends GetView<PaymentProofController> {
  const PaymentScreenDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      backgroundColor: Styles.black,
      bottomNavigationBar: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: CustomButton(
          onTap: () {
            if (controller.image != null) {
              controller.makePayment();
            }
          },
          radius: 10,
          bgColor: Styles.orangeYellow,
          title: "Continue",
          borderColor: Styles.orangeYellow,
        ),
      ),
      appBar: CustomAppBar(
        bgColor: Styles.black,
        backButtonColor: Colors.white,
        title: "Create Task",
        titleColor: Styles.white,
        leading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            decoration: const BoxDecoration(color: Styles.orangeYellow),
            width: Get.width,
            child: const CustomTextWidget(
              text: "Payment",
              color: Styles.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GetBuilder<PaymentProofController>(builder: (_) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomTextWidget(
                        text: "Attach Payment Screenshot",
                        color: Styles.orangeYellow,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.pickImage();
                        },
                        child: Image.asset(
                          "assets/images/file_upload.png",
                          height: 19,
                          width: 16,
                          color: Styles.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  controller.image == null
                      ? const SizedBox.shrink()
                      : Image.file(
                          controller.image!,
                          fit: BoxFit.fitWidth,
                          height: Get.height * 0.55,
                          width: Get.width,
                        ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
