import 'package:get/get.dart';

import '../controller/payment_proof_controller.dart';

class PaymentProofBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentProofController());
  }
}
