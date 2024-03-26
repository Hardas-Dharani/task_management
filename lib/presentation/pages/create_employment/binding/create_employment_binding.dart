import 'package:get/get.dart';

import '../controller/create_employment_controller.dart';

class CreateEmploymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateEmploymentController());
  }
}
