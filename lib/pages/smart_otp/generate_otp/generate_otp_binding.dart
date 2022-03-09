import 'package:get/get.dart';
import 'package:trading_module/data/repos/otp_repo_impl.dart';
import 'package:trading_module/data/services/otp_services.dart';
import 'package:trading_module/domain/repos/otp_repo.dart';
import 'package:trading_module/domain/use_cases/otp_use_case.dart';
import 'package:trading_module/utils/enums.dart';

import 'generate_otp_controller.dart';

class GenerateOtpBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is List) {
      Get.lazyPut<OtpRepo>(() => OtpRepoImpl(OtpServiceImpl()));
      Get.lazyPut<OtpUseCase>(() => OtpUseCase(Get.find()));
      Get.lazyPut(() => GenerateOtpController(
          pin: arg[0] as String,
          initOTP: arg[1] as String,
          type: arg[2] as SmartOTPType
      ));
    }
  }
}
