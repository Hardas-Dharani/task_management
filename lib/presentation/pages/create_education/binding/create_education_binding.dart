import 'package:get/get.dart';

import '../controller/create_education_controller.dart';

class CreateEducationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateEducationController());
  }
}
