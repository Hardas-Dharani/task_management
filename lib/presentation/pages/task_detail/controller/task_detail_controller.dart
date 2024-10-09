import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/components/custom_button_component.dart';
import 'package:task_management/components/custom_text_component.dart';
import 'package:task_management/routes/app_routes.dart';
import 'package:task_management/utils/styles.dart';

import '../../../../app/services/local_storage.dart';
import '../../../../data/models/pre_request_model.dart';
import '../../../../data/models/revision_list_model.dart';
import '../../../../data/models/task_detail_model.dart';
import '../../../../data/repositories/task_repository.dart';
import '../../../../utils/loader.dart';
import '../../../../utils/toast_component.dart';

class TaskDetailController extends GetxController {
  TextEditingController searchTextEditingController = TextEditingController();
  final forgotPasswordFormKey = GlobalKey<FormState>();
  String title = "";
  String reply = "";

  bool isFromQuote = false;
  bool isDecline = false;
  bool isCompletedTask = false;
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
  RevisionListModel revisionListModel = RevisionListModel();
  RevisionDetailModel revisionDetailModel = RevisionDetailModel();
  int? taskID;
  String selectedList = "All Project";
  Future<void> accpetTask(String values) async {
    try {
      final result =
          await TaskRepositoryIml().getAllPropsal("task/accept/$values", {});

      LoadingDialog.hide();
      if (result['status']) {
      } else {
        ToastComponent().showToast(result['message']);
      }
    } catch (e) {
      print(e.toString());
      ToastComponent().showToast(e.toString());
      LoadingDialog.hide();
    }
    update();
  }

  Future<void> accpetTeacher(Map<String, dynamic> values) async {
    try {
      final result =
          await TaskRepositoryIml().postData(values, "task/accept/teacher");

      LoadingDialog.hide();
      if (result['status']) {
      } else {
        ToastComponent().showToast(result['message']);
      }
    } catch (e) {
      print(e.toString());
      ToastComponent().showToast(e.toString());
      LoadingDialog.hide();
    }
    update();
  }

  Future<void> getAllRevis(String id) async {
    try {
      LoadingDialog.show();
      final result =
          await TaskRepositoryIml().getTaskList("revision/all/$id", "");

      if (result['status'] != null) {
        revisionListModel = RevisionListModel.fromJson(result);
        LoadingDialog.hide();
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

  Future<void> getAllRevisDetail(String id) async {
    try {
      LoadingDialog.show();
      final result =
          await TaskRepositoryIml().getTaskList("revision/detail/$id", "");

      if (result['status'] != null) {
        revisionDetailModel = RevisionDetailModel.fromJson(result);
        LoadingDialog.hide();
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

  Future<void> getTaskDetail(String id) async {
    try {
      LoadingDialog.show();
      final result =
          await TaskRepositoryIml().getTaskList("task/detail/$id", "");
      LoadingDialog.hide();
      if (result['status'] != null) {
        await getAllRevis(taskID.toString());
        taskDetailModel = TaskDetailModel.fromJson(result);
        if (taskDetailModel.data!.task!.quotationStatus == "not_required") {
          if (taskDetailModel.data!.task!.paymentStatus == "approved") {
          } else {
            if (Get.find<LocalStorageService>()
                    .loginModel!
                    .data!
                    .user!
                    .roleId ==
                2) {
              _showPaymentCustomDialog(
                  taskDetailModel.data!.task!.id!.toString());
            }
          }
        } else {
          if (taskDetailModel.data!.task!.quotationStatus ==
              "approval_pending") {
          } else {
            _showQuotationCustomDialog();
          }
        }
      } else {
        ToastComponent().showToast(result['message']);
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
    if (Get.arguments != null) {
      if (Get.arguments["id"] != null) {
        taskID = Get.arguments["id"];
        getTaskDetail(taskID.toString());
      }
      if (Get.arguments['isComplete'] != null) {
        isCompletedTask = Get.arguments['isComplete'];
      }
    }

    super.onInit();
  }

  Future<void> replyRevision(String values) async {
    try {
      Map<String, dynamic> taskData = {
        "revision_id": revisionDetailModel.data!.revision!.id!.toString(),
        "reply": reply,
        "approved": values
      };

      final result =
          await TaskRepositoryIml().postData(taskData, "revision/update");

      LoadingDialog.hide();
      if (result['status']) {
      } else {
        ToastComponent().showToast(result['message']);
      }
    } catch (e) {
      print(e.toString());
      ToastComponent().showToast(e.toString());
      LoadingDialog.hide();
    }
    update();
  }

  void _showPaymentCustomDialog(String id) {
    Get.defaultDialog(
      backgroundColor: Styles.black,
      title: '',
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/dollar_icon.png",
              height: 66,
              width: 66,
            ),
            const SizedBox(height: 20.0),
            const CustomTextWidget(
              text:
                  "Proced to payment. If you have paid kindly provide a screenshot as a confirmation of payment.",
              fontSize: 13,
              textAlign: TextAlign.center,
              color: Styles.white,
              fontWeight: FontWeight.w300,
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      Get.back();
                      Get.offAndToNamed(Routes.paymentProof,
                          arguments: {"taskID": id});
                    },
                    radius: 10,
                    title: "Paid",
                    bgColor: Styles.black,
                    borderColor: Styles.orangeYellow,
                    fontColor: Styles.orangeYellow,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      Get.back();

                      Get.offAndToNamed(Routes.bankDetail);
                    },
                    radius: 10,
                    title: "Pay Now",
                    bgColor: Styles.orangeYellow,
                    fontColor: Styles.black,
                    borderColor: Styles.orangeYellow,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showQuotationCustomDialog() {
    Get.defaultDialog(
      backgroundColor: Styles.black,
      title: '',
      content: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/quatation.png",
            height: 66,
            width: 66,
          ),
          const SizedBox(height: 20.0),
          const CustomTextWidget(
            text: "Please wait for get quatation fees.",
            fontSize: 13,
            textAlign: TextAlign.center,
            color: Styles.white,
            fontWeight: FontWeight.w300,
          ),
          const SizedBox(height: 20.0),
          CustomButton(
            width: 180,
            onTap: () {
              Get.back();
            },
            radius: 10,
            title: "Okay",
            bgColor: Styles.orangeYellow,
          ),
        ],
      ),
    );
  }
}