import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/data/models/quotation_model.dart';
import 'package:task_management/data/repositories/task_repository.dart';

import '../../../../components/custom_button_component.dart';
import '../../../../components/custom_textfield_component.dart';
import '../../../../data/models/task_detail_model.dart';
import '../../../../data/models/task_list_model.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/loader.dart';
import '../../../../utils/styles.dart';
import '../../../../utils/toast_component.dart';

class AdminHomeController extends GetxController
    with SingleGetTickerProviderMixin {
  TextEditingController searchTextEditingController = TextEditingController();
  final forgotPasswordFormKey = GlobalKey<FormState>();
  String title = "";
  bool isFromQuote = false;
  TabController? tabController;
  TaskDetailModel taskDetailModel = TaskDetailModel();
  int? selectedIndex = 0;
  final globalKey = GlobalKey<ScaffoldState>();
  FocusNode focusSearch = FocusNode();
  var currentIndex = 0.obs;
  String selectedSort = '';
  TaskListModel taskModel = TaskListModel();
  TaskListModel mostRecentTaskModel = TaskListModel();

  String selectedList = "Public Tasks";

  QuotationModel quotationModel = QuotationModel();
  QuotationModel paymentModel = QuotationModel();

  String? quotationPrice;

  Future<void> getMostRecenPayment(String filter) async {
    try {
      LoadingDialog.show();
      final result = await TaskRepositoryIml()
          .getRecentTaskList("payment/pending", filter);

      if (result['data'] != null) {
        await getMostRecentQuotation("");
        paymentModel = QuotationModel.fromJson(result);
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

  Future<void> getMostRecentQuotation(String filter) async {
    try {
      LoadingDialog.show();

      final result = await TaskRepositoryIml()
          .getRecentTaskList("quotation/pending", filter);

      if (result['data'] != null) {
        quotationModel = QuotationModel.fromJson(result);

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

  Future<void> getTaskDetail(String id) async {
    try {
      LoadingDialog.show();
      final result =
          await TaskRepositoryIml().getTaskList("task/detail/$id", "");
      LoadingDialog.hide();
      if (result['status'] != null) {
        taskDetailModel = TaskDetailModel.fromJson(result);
      } else {
        ToastComponent().showToast(result['message']);
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
      final result = await TaskRepositoryIml().getBestMatchTaskList();

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
    // getTaskList();
    getMostRecenPayment("");
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  Future<void> sendQuote(String values, String taskId) async {
    try {
      Map<String, dynamic> taskData = {"task_id": taskId, "quote": values};

      final result =
          await TaskRepositoryIml().postData(taskData, "quotation/create");

      LoadingDialog.hide();
      if (result['status']) {
        Get.offAllNamed(Routes.adminHome);
      } else {
        ToastComponent().showToast(result['message']);
      }
    } catch (e) {
      print(e.toString());
      ToastComponent().showToast("Sign in getting server error");
      LoadingDialog.hide();
    }
    update();
  }

  void showQuotationCustomDialog(String id) {
    Get.defaultDialog(
      backgroundColor: Styles.black,
      title: '',
      content: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/quatation.png",
            height: 66,
            width: 66,
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Center(
              child: CustomTextField(
                hint: "\$00.00",
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.done,
                hintColor: Styles.white,
                hintFontSize: 40,
                textFieldColor: Styles.white,
                onChangeFtn: (p0) {
                  quotationPrice = p0;
                  return p0!;
                },
                fillColor: Colors.transparent,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          CustomButton(
            width: 180,
            onTap: () async {
              if (quotationPrice != null) {
                await sendQuote(quotationPrice!, id);
              }
            },
            radius: 10,
            title: "Send Quote",
            bgColor: Styles.orangeYellow,
          ),
        ],
      ),
    );
  }
}

class TaskModel {
  final String? title;
  final String? description;
  final double? budget;
  final String? category;
  final String? clientName;
  final String? status;
  final String? dueDate; // Added time attribute

  TaskModel({
    this.title,
    this.description,
    this.budget,
    this.category,
    this.clientName,
    this.status,
    this.dueDate, // Initialize the time attribute
  });
}
