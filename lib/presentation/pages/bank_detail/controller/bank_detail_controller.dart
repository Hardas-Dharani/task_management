// ignore_for_file: unused_field

import 'package:get/get.dart';

import '../../../../data/models/bank_detail_model.dart';
import '../../../../data/repositories/task_repository.dart';
import '../../../../utils/loader.dart';
import '../../../../utils/toast_component.dart';

class BankDetailController extends GetxController {
  BankDetailModel bankDetailModel = BankDetailModel();
  Future<void> getBankDetail() async {
    try {
      LoadingDialog.show();
      final result =
          await TaskRepositoryIml().getTaskList("payment/pre-req/", "");

      if (result['status'] != null) {
        LoadingDialog.hide();
        bankDetailModel = BankDetailModel.fromJson(result);
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
    getBankDetail();
    // TODO: implement onInit
    super.onInit();
  }
}
