import 'package:get/get.dart';

import 'verify_sms_otp_controller.dart';

class VerifySMSOTPBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    Get.lazyPut(() => VerifySMSOTPController());
  }
}
