import 'package:get/get.dart';

import '../controller/create_task_controller.dart';

class CreateTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateTaskController(), fenix: true);
  }
}
