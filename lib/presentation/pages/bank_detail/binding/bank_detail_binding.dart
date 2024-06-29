import 'package:get/get.dart';

import '../controller/bank_detail_controller.dart';

class BankDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BankDetailController());
  }
}
