import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/data/models/task_detail_model.dart';

import '../../../../data/repositories/task_repository.dart';
import '../../../../utils/loader.dart';
import '../../../../utils/toast_component.dart';

class TaskRevisionController extends GetxController {
  FocusNode focusName = FocusNode();
  TextEditingController titleTextEditingController = TextEditingController();
  List<File> listFileSelected = [];
  FocusNode focusCpassword = FocusNode();

  TextEditingController descriptionTextEditingController =
      TextEditingController();
  Task task = Task();
  Future<void> createRevision() async {
    try {
      LoadingDialog.show();

      Map<String, dynamic> taskData = {
        "subject": titleTextEditingController.text,
        "task_id": task.id,
        "student_id": task.studentId,
        "teacher_id": task.teacherId,
        "description": descriptionTextEditingController.text,
        "files": listFileSelected,
      };

      // Add the teacher data to the task data

      final result =
          await TaskRepositoryIml().fromPostData(taskData, "revision/create");

      if (result['status']) {
        ToastComponent().showToast("Task Createed");
        LoadingDialog.hide();
        Get.back();
        Get.back();
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

  @override
  void onInit() {
    // TODO: implement onInit
    if (Get.arguments != null) {
      task = Get.arguments['taskDetail'];
    }
    super.onInit();
  }

  Future<void> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      listFileSelected.add(file);
    } else {
      // User canceled the picker
    }
    update();
  }
}
