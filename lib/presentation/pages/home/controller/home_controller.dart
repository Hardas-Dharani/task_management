import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/task_list_model.dart';
import '../../../../data/repositories/task_repository.dart';
import '../../../../utils/loader.dart';
import '../../../../utils/toast_component.dart';

class HomeController extends GetxController {
  TextEditingController searchTextEditingController = TextEditingController();
  final forgotPasswordFormKey = GlobalKey<FormState>();
  String title = "";
  bool isFromQuote = false;
  final globalKey = GlobalKey<ScaffoldState>();
  FocusNode focusSearch = FocusNode();
  var currentIndex = 0.obs;

  String selectedSort = '';
  List<String> sortList = [
    'All Project',
    'In Progress',
    'Complete',
    'Deleted',
  ];
  String selectedList = "All Project";
  TaskListModel taskModel = TaskListModel();

  Future<void> deleteTask(String id) async {
    try {
      LoadingDialog.show();
      final result = await TaskRepositoryIml().deleteTask(id);

      if (result['status_code'] == 200) {
        await getTaskList();
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

  Future<void> getTaskList() async {
    try {
      LoadingDialog.show();
      final result = await TaskRepositoryIml().getTaskList();

      if (result['data'] != null) {
        taskModel = TaskListModel.fromJson(result);

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
      print("errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
      title = Get.arguments["title"];
    }
    getTaskList();
    super.onInit();
  }
}
