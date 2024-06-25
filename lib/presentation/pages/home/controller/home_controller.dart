import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/data/models/user_firebase.dart';

import '../../../../data/models/proposal_lst.dart';
import '../../../../data/models/task_list_model.dart';
import '../../../../data/repositories/task_repository.dart';
import '../../../../utils/loader.dart';
import '../../../../utils/toast_component.dart';
import '../../chat/widget/message.dart';

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
  GetListPropsalModel getListPropsalModel = GetListPropsalModel();

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

  Future<void> getAllPropsal(String taskID) async {
    try {
      LoadingDialog.show();
      final result = await TaskRepositoryIml()
          .getAllPropsal("proposal", {"task_id": taskID});

      if (result['data'].isNotEmpty) {
        LoadingDialog.hide();
        getListPropsalModel = GetListPropsalModel.fromJson(result);
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
      final result = await TaskRepositoryIml().getTaskList("task/all");

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

  Future<void> sendRequestData(Map<String, dynamic> data, String apiPath,
      {User? user}) async {
    try {
      LoadingDialog.show();
      final result = await TaskRepositoryIml().postData(data, apiPath);

      if (result['message'] != null) {
        // ToastComponent().showToast("Task Createed");
        if (apiPath == "proposal/accept") {
          LoadingDialog.hide();
          UserFireBaseModel userFireBaseModel = UserFireBaseModel(
              id: user!.id.toString(),
              name: user.name!,
              isOnline: true,
              profilePictureUrl: user.imageUrl.toString(),
              lastSeen: {});
          Get.to(
              () => MessageWidgetScreen(userFireBaseModel: userFireBaseModel));
        }
      } else {
        ToastComponent().showToast(result['message']);
        LoadingDialog.hide();
      }
    } catch (e) {
      print(e.toString());
      LoadingDialog.hide();
      ToastComponent().showToast("Sign in getting server error");
    }
    update();
  }
}
