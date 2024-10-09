import 'package:get/get.dart';

import '../controller/admin_earning_controller.dart';

class AdminEarningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminEarningController());
  }
}
