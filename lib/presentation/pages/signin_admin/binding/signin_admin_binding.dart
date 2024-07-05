import 'package:get/get.dart';
import '../controller/signin_admin_controller.dart';

class SiginAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SigninAdminController());
  }
}
