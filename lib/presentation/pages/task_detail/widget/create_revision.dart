import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/custom_appbar_component.dart';
import '../../../../components/custom_button_component.dart';
import '../../../../components/custom_text_component.dart';
import '../../../../components/custom_textfield_component.dart';
import '../../../../components/main_scaffold_component.dart';
import '../../../../utils/styles.dart';
import '../controller/create_revision_controller.dart';

class CreateRevision extends GetView<TaskRevisionController> {
  const CreateRevision({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: CustomButton(
          onTap: () {
            controller.createRevision();
          },
          bgColor: Styles.orangeYellow,
          radius: 10,
          title: "Submit",
        ),
      ),
      backgroundColor: Styles.black,
      // bottomNavigationBar: const SizedBox(),
      appBar: CustomAppBar(
        bgColor: Styles.black,
        backButtonColor: Colors.white,
        title: "Create Revisions",
        titleColor: Styles.white,
        leading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextWidget(
              text: "Subject",
              color: Styles.orangeYellow,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              textFieldColor:
                  controller.focusName.hasFocus ? Styles.black : Styles.white,
              maxLines: 1,
              fillColor: controller.focusName.hasFocus
                  ? Styles.white
                  : Styles.greyLight.withOpacity(0.10),
              focusColor: controller.focusName.hasFocus
                  ? Styles.orangeYellow
                  : Styles.white,
              hint: "Title",
              hintFontSize: 16,
              hintColor: Styles.solidGrey,
              txtController: controller.titleTextEditingController,
              textInputAction: TextInputAction.next,
              node: controller.focusName,
              onTap: () {},
              padding: 17,
              borderRadius: 9,
            ),
            const SizedBox(height: 20),
            const CustomTextWidget(
              text: "Description",
              color: Styles.orangeYellow,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              maxLines: 8,
              fillColor: controller.focusCpassword.hasFocus
                  ? Styles.white
                  : Styles.greyLight.withOpacity(0.10),
              focusColor: controller.focusCpassword.hasFocus
                  ? Styles.orangeYellow
                  : Styles.white,
              hint: "Description",
              hintFontSize: 16,
              hintColor: Styles.solidGrey,
              textInputType: TextInputType.text,
              minLines: 5,
              txtController: controller.descriptionTextEditingController,
              textInputAction: TextInputAction.next,
              node: controller.focusCpassword,
              onTap: () {},
              padding: 17,
              borderRadius: 9,
            ),
            const SizedBox(height: 20),
            const CustomTextWidget(
              text: "Upload your project file",
              color: Styles.orangeYellow,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              textFieldColor: Styles.white,
              maxLines: 1,
              fillColor: Styles.greyLight.withOpacity(0.10),
              focusColor: Styles.white,
              hint: "File Upload",
              hintFontSize: 16,
              suffixWidget: IconButton(
                  onPressed: () {
                    controller.selectFile();
                  },
                  icon: Image.asset(
                    "assets/images/file_upload.png",
                    height: 15,
                    width: 15,
                  )),
              hintColor: Styles.solidGrey,
              textInputType: TextInputType.text,
              // txtController:
              //     controller.startDateTextEditingController,
              textInputAction: TextInputAction.next,
              // node: controller.focusNumber,
              readOnly: true,
              onTap: () {},
              padding: 17,
              borderRadius: 9,
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 10.0, // gap between adjacent items
              runSpacing: 10.0, // gap between lines
              children: List.generate(
                controller
                    .listFileSelected.length, // number of icons to display
                (index) => const Icon(
                  Icons.star,
                  size: 50.0,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
