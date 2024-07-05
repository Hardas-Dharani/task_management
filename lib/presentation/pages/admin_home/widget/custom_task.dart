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
            height: 15,
          ),
          taskModel.typeId == 1
              ? CustomTextWidget(
                  text: "${taskModel.type!.title} (${taskModel.wordCount})",
                  fontSize: 12,
                  color: Styles.white,
                  fontWeight: FontWeight.w400,
                )
              : CustomTextWidget(
                  text: "${taskModel.type!.title}",
                  fontSize: 12,
                  color: Styles.white,
                  fontWeight: FontWeight.w400,
                ),
          const SizedBox(
            height: 15,
          ),
          CustomTextWidget(
            text: Styles().formatRelativeTime(taskModel.createdAt.toString()),
            fontSize: 12,
            color: Styles.white,
            fontWeight: FontWeight.normal,
          ),
        ],
      ),
    );
  }
}
