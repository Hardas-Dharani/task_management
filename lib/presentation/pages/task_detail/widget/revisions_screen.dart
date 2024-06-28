import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_button_component.dart';
import 'package:task_management/components/custom_text_component.dart';
import 'package:task_management/utils/styles.dart';

class RevisionsScreen extends StatelessWidget {
  const RevisionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Row(
          children: [
            Expanded(
                child: CustomButton(
              bgColor: Styles.black,
              borderColor: Styles.orangeYellow,
              radius: 10,
              title: "Decline",
              fontColor: Styles.orangeYellow,
            )),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: CustomButton(
              bgColor: Styles.orangeYellow,
              radius: 10,
              title: "Approve",
            ))
          ],
        ),
      ),
      backgroundColor: Styles.black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Styles.white,
            )),
        backgroundColor: Styles.black,
        title: const CustomTextWidget(
          text: 'Revisions',
          color: Styles.white,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  text: "Task Details:",
                  color: Styles.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                CustomTextWidget(
                  text: "5m Ago",
                  color: Styles.orangeYellow,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextWidget(
              text: "Subject",
              color: Styles.orangeYellow,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 5,
            ),
            const CustomTextWidget(
              text: "Task Title",
              color: Styles.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextWidget(
              text: "Description",
              color: Styles.orangeYellow,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextWidget(
              text:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              color: Styles.white.withOpacity(.6),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextWidget(
              text: "Reason For Decline...",
              color: Styles.orangeYellow,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextWidget(
              text:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              color: Styles.white.withOpacity(.6),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}





//public public, shared with me =shared_me , my task empty ,in progress in_progress ,complete complete
//