import 'package:get/get.dart';

import 'generate_otp_controller.dart';

class GenerateOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GenerateOtpController());
  }
}
