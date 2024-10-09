// ignore_for_file: unused_field

import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_management/routes/app_routes.dart';

import '../../../../data/repositories/task_repository.dart';
import '../../../../utils/loader.dart';
import '../../../../utils/toast_component.dart';

class PaymentProofAdminController extends GetxController {
  File? image;
  String? imageSource;
  int? taskId;

  @override
  void onInit() {
    if (Get.arguments != null) {
      taskId = Get.arguments['taskID'];
      imageSource = Get.arguments['image'];
    }
    // TODO: implement onInit
    super.onInit();
  }

  // fromPostData
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    update();
  }

  Future<void> updatePayment(String status) async {
    try {
      LoadingDialog.show();

      Map<String, dynamic> taskData = {
        "task_id": taskId,
        "status": status,
      };

      // Add the teacher data to the task data

      // selectedIdTeacher.asMap((e) => ids.add(e.id!));
      // ids.add(value)
      final result =
          await TaskRepositoryIml().fromPostData(taskData, "payment/update");

      if (result['status']) {
        LoadingDialog.hide();
        Get.offAllNamed(Routes.adminHome);
      } else {
        ToastComponent().showToast(result['message']);
        LoadingDialog.hide();
      }
    } catch (e) {
      print(e.toString());
      ToastComponent().showToast(e.toString());
      LoadingDialog.hide();
    }
    update();
  }
}
