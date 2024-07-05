import 'package:get/get.dart';

import '../controller/payment_proof_admin_controller.dart';

class PaymentProofAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentProofAdminController());
  }
}
