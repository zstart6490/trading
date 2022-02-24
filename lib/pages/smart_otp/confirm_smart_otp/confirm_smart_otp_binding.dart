import 'dart:developer';

import 'package:get/get.dart';

import 'confirm_smart_otp_controller.dart';

class ConfirmSmartOTPBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfirmSmartOtpController());
  }
}
