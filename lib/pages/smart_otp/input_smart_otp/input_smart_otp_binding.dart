import 'package:get/get.dart';
import 'package:trading_project/utils/enums.dart';
import 'input_smart_otp_controller.dart';

class InputSmartOTPBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is SmartOTPType) {
      Get.lazyPut(() => InputSmartOTPController(arg));
    }
  }
}
