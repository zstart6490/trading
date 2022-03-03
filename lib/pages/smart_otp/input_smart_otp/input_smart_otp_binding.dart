import 'package:get/get.dart';
import 'package:trading_module/utils/enums.dart';
import 'input_smart_otp_controller.dart';

class InputSmartOTPBinding extends Bindings {
  @override
  void dependencies() {
    const arg = SmartOTPType.create;
    //if (arg is SmartOTPType) {
      Get.lazyPut(() => InputSmartOTPController(arg));
    //}
  }
}
