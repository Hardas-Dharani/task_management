import 'package:get/get.dart';

import '../controller/create_revision_controller.dart';
import '../controller/task_detail_controller.dart';

class TaskRevisionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskRevisionController(), fenix: true);
  }
}
