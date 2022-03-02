import 'package:get/get.dart';

import 'create_smart_otp_controller.dart';

class CreateSmartOTPConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateSmartOTPController());
  }
}
