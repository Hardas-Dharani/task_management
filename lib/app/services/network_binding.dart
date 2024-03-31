import 'package:get/get.dart';

import 'custom_txt_controller.dart';

class NetworkBinding extends Bindings {
  // dependence injection attach our class.
  @override
  void dependencies() {
    // Get.put(GetXNetworkManager(), permanent: true);
    Get.put(CustomTxtController(), permanent: true);
    // Get.lazyPut<GetXNetworkManager>(() => GetXNetworkManager());
  }
}
