import 'package:flutter/material.dart';

import '../../../../components/custom_text_component.dart';
import '../../../../utils/styles.dart';

class ContainerTabTask extends StatelessWidget {
  const ContainerTabTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: const Color(0xff858585))),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          const Row(
            children: [
              CustomTextWidget(
                text: "Task Title",
                fontSize: 19,
                color: Styles.white,
                fontWeight: FontWeight.bold,
              ),
              Spacer(),
              CustomTextWidget(
                text: "\$30.00",
                fontWeight: FontWeight.w600,
                color: Styles.orangeYellow,
                fontSize: 22,
              )
            ],
          ),
          const SizedBox(
            height: 26,
          ),
          const Row(
            children: [
              CustomTextWidget(
                text: "Essay  ",
                fontWeight: FontWeight.w600,
                color: Styles.white,
                fontSize: 14,
              ),
              CustomTextWidget(
                text: "(600 words)",
                fontWeight: FontWeight.w600,
                color: Color(0xff858585),
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
              const CustomTextWidget(
                text: "Danny",
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
              const CustomTextWidget(
                text: "01/31/2000",
                fontWeight: FontWeight.w600,
                color: Styles.white,
                fontSize: 14,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: const Color(0xff858585))),
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                child: const CustomTextWidget(
                  text: "Pending",
                  fontWeight: FontWeight.w600,
                  color: Styles.orangeYellow,
                  fontSize: 14,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
