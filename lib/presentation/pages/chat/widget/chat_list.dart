import 'package:flutter/material.dart';

import '../../../../components/custom_text_component.dart';
import '../../../../utils/styles.dart';

class ChatListWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subtitle;
  final String? messageCount;
  final bool expired;
  const ChatListWidget(
      {super.key,
      required this.title,
      required this.image,
      required this.messageCount,
      required this.subtitle,
      this.expired = false});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: 45,
              width: 45,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(25)),
              child: Image.asset(
                "assets/images/teacher_icon.png",
                height: 30,
                width: 30,
              ),
            ),
            messageCount == "null"
                ? const SizedBox()
                : messageCount != ''
                    ? Container(
                        alignment: Alignment.center,
                        height: 19,
                        decoration: BoxDecoration(
                            color: Styles.primaryColor,
                            borderRadius: BorderRadius.circular(7)),
                        width: 16,
                        child: CustomTextWidget(
                          text: messageCount ?? "",
                          fontSize: 13,
                          color: Styles.white,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    : const SizedBox(),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  text: title!.trim(),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  width: 100,
                ),
                expired
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 9, vertical: 2),
                        decoration: BoxDecoration(
                            color: Styles.yellow,
                            borderRadius: BorderRadius.circular(8)),
                        child: const CustomTextWidget(
                          text: "Your move",
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Styles.white,
                        ),
                      )
                    : const SizedBox()
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            !expired
                ? CustomTextWidget(
                    text: subtitle ?? "",
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  )
                : CustomTextWidget(
                    text: subtitle ?? "",
                    fontSize: 13,
                    color: Styles.grey,
                    fontWeight: FontWeight.w400,
                  )
          ],
        )
        // Container(
        //   height: 100,
        //   width: 57,
        //   decoration: const BoxDecoration(
        //       image: DecorationImage(
        //           image: ),
        //       shape: BoxShape.circle),
        // )
      ],
    );
  }
}
