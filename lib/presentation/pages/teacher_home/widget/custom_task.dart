import 'package:flutter/material.dart';
import 'package:task_management/data/models/task_list_model.dart';

import '../../../../components/custom_text_component.dart';
import '../../../../utils/styles.dart';

class CustomTaskWidget extends StatelessWidget {
  final TaskData taskModel;

  const CustomTaskWidget({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Styles.orangeYellow)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomTextWidget(
                text: taskModel.title ?? "",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Styles.white,
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextWidget(
            text: 'Client: ${taskModel.teacher}', // Display the client name
            fontSize: 12, color: Styles.white,
            fontWeight: FontWeight.normal,
          ),
          const SizedBox(
            height: 5,
          ),
          // CustomTextWidget(
          //   text:
          //       'Category: ${taskModel.user!.college}', // Display the category
          //   fontSize: 12,
          //   fontWeight: FontWeight.normal,
          // ),
          const SizedBox(
            height: 5,
          ),
          CustomTextWidget(
            text: Styles().formatRelativeTime(taskModel.createdAt.toString()),
            fontSize: 12,
            color: Styles.white,
            fontWeight: FontWeight.normal,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              // RichTextWidget(
              //   text: "${taskModel.budget}",
              //   textFontSize: 16,
              //   textFontWeight: FontWeight.bold,
              //   color: Styles.orangeYellow,
              //   onTapColor: Styles.white,
              //   onTapText: " Price",
              //   onTapFontSize: 12,
              // ),
              // const Spacer(),
              Image.asset(
                "assets/images/icons/verify_icon.png",
                width: 15,
              ),
              const SizedBox(
                width: 10,
              ),
              const CustomTextWidget(
                text: "Payment Verified",
                fontSize: 12,
                color: Styles.white,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Styles.orangeYellow.withOpacity(0.5),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextWidget(
            text: taskModel.description ?? "",
            fontSize: 12,
            color: Styles.white,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
