// ignore_for_file: unused_field

import 'package:get/get.dart';

import '../../../../data/models/earning_model.dart';
import '../../../../data/repositories/task_repository.dart';
import '../../../../utils/loader.dart';
import '../../../../utils/toast_component.dart';

class AdminEarningController extends GetxController {
  EarningTeacherData earningTeacherData = EarningTeacherData();
  Future<void> getEarning() async {
    try {
      LoadingDialog.show();
      final result =
          await TaskRepositoryIml().getTaskList("earnings/teachers", "");

      if (result['status'] != null) {
        LoadingDialog.hide();
        earningTeacherData = EarningTeacherData.fromJson(result);
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
    getEarning();
    // TODO: implement onInit
    super.onInit();
  }
}
