import 'package:get/get.dart';

import '../controller/teacher_earning_controller.dart';

class TeacherEarningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherEarningController());
  }
}
