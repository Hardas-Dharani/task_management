import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/pre_request_model.dart';
import '../../../../data/models/task_detail_model.dart';
import '../../../../data/repositories/task_repository.dart';
import '../../../../utils/loader.dart';
import '../../../../utils/toast_component.dart';

class TaskDetailController extends GetxController {
  TextEditingController searchTextEditingController = TextEditingController();
  final forgotPasswordFormKey = GlobalKey<FormState>();
  String title = "";
  bool isFromQuote = false;
  final globalKey = GlobalKey<ScaffoldState>();
  FocusNode focusSearch = FocusNode();
  var currentIndex = 0.obs;

  String selectedSort = '';
  List<String> sortList = [
    'Article',
    'Writing',
    'Content Book',
    'Ebook',
  ];
  List<Teachers> selectedIdTeacher = [];
  TaskDetailModel taskDetailModel = TaskDetailModel();
  int? taskID;
  String selectedList = "All Project";
  Future<void> getTaskDetail(String id) async {
    try {
      LoadingDialog.show();
      final result =
          await TaskRepositoryIml().getTaskList("task/detail/$id", "");

      if (result['status'] != null) {
        taskDetailModel = TaskDetailModel.fromJson(result);
        LoadingDialog.hide();
      } else {
        ToastComponent().showToast(result['message']);
        LoadingDialog.hide();
      }
    } catch (e) {
      print(e.toString());
      ToastComponent().showToast("Sign in getting server error");
      LoadingDialog.hide();
    }
    update();
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      taskID = Get.arguments["id"];
    }
    getTaskDetail(taskID.toString());
    super.onInit();
  }
}
