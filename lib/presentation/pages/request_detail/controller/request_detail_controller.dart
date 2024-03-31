import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/data/models/task_list_model.dart';

import '../../../../data/models/get_all_task_request.dart';
import '../../../../data/repositories/task_repository.dart';
import '../../../../utils/loader.dart';
import '../../../../utils/toast_component.dart';

class RequestDetailController extends GetxController {
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
  TaskListModelData taskListModelData = TaskListModelData();
  String selectedList = "All Project";
  GetAllTaskRequest getAllTaskRequestModel = GetAllTaskRequest();

  Future<void> getAllTaskRequest(String id) async {
    try {
      LoadingDialog.show();
      final result =
          await TaskRepositoryIml().getAllRequestTask("task-request", "29");

      if (result['data'] != null) {
        // ToastComponent().showToast("Task Createed");
        LoadingDialog.hide();
        getAllTaskRequestModel = GetAllTaskRequest.fromJson(result);
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
      taskListModelData = Get.arguments["taskDetail"];
    }
    super.onInit();
  }

  Future<void> sendRequest(String taskId) async {
    try {
      LoadingDialog.show();
      final result = await TaskRepositoryIml().postData({
        "task_id": taskId,
      }, "task-request/deny");

      if (result['data'] != null) {
        ToastComponent().showToast("Task Createed");
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
}
