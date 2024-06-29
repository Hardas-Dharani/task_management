import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_text_component.dart';

import '../../../../components/custom_appbar_component.dart';
import '../../../../components/main_scaffold_component.dart';
import '../../../../utils/styles.dart';
import '../../../data/models/bank_detail_model.dart';
import 'controller/bank_detail_controller.dart';

class BankDetailScreen extends GetView<BankDetailController> {
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
            GetBuilder<BankDetailController>(builder: (_) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    controller.bankDetailModel.data != null &&
                            controller.bankDetailModel.data!.paymentMethods !=
                                null
                        ? ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 15,
                            ),
                            shrinkWrap: true,
                            itemCount: controller
                                .bankDetailModel.data!.paymentMethods!.length,
                            itemBuilder: (context, index) {
                              return selectedBank(controller.bankDetailModel
                                  .data!.paymentMethods![index]);
                            },
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  Widget selectedBank(PaymentMethods paymentMethods) {
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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CustomTextWidget(
                    text: "Account Title: ",
                    color: Styles.white,
                    fontSize: 16,
                  ),
                  CustomTextWidget(
                    text: paymentMethods.name ?? "",
                    fontSize: 14,
                    color: const Color(0xffB5B5B5),
                  ),
                ],
              ),
              Row(
                children: [
                  const CustomTextWidget(
                    text: "Account No: ",
                    color: Styles.white,
                    fontSize: 16,
                  ),
                  CustomTextWidget(
                    text: paymentMethods.number ?? "",
                    fontSize: 14,
                    color: const Color(0xffB5B5B5),
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
