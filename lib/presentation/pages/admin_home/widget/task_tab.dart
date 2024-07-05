import 'package:flutter/material.dart';

import '../../../../components/custom_text_component.dart';
import '../../../../data/models/task_list_model.dart';
import '../../../../utils/styles.dart';

class ContainerTaskTab extends StatelessWidget {
  final TaskData? taskData;
  final Function()? onTap;
  const ContainerTaskTab({super.key, this.taskData, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: const Color(0xff858585))),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Row(
              children: [
                CustomTextWidget(
                  text: taskData!.title ?? "",
                  fontSize: 19,
                  color: Styles.white,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                taskData!.fee == null
                    ? const SizedBox.square()
                    : CustomTextWidget(
                        text: "\$ ${taskData!.fee ?? ""}",
                        fontWeight: FontWeight.w600,
                        color: Styles.orangeYellow,
                        fontSize: 22,
                      )
              ],
            ),
            const SizedBox(
              height: 26,
            ),
            Row(
              children: [
                taskData!.wordCount == null
                    ? const SizedBox.shrink()
                    : CustomTextWidget(
                        text: " (${taskData!.wordCount} words)",
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff858585),
                        fontSize: 14,
                      )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Image.asset(
                  "assets/images/person_image.png",
                  height: 28,
                  width: 28,
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomTextWidget(
                  text: taskData!.title ?? "",
                  fontWeight: FontWeight.w600,
                  color: Styles.white,
                  fontSize: 14,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  text: Styles().StringConvertDateTime(taskData!.deadline!),
                  fontWeight: FontWeight.w600,
                  color: Styles.white,
                  fontSize: 14,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}