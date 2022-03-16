import 'package:get/get.dart';
import 'package:trading_module/data/repos/otp_repo_impl.dart';
import 'package:trading_module/data/services/otp_services.dart';
import 'package:trading_module/domain/repos/otp_repo.dart';
import 'package:trading_module/domain/use_cases/otp_use_case.dart';
import 'package:trading_module/utils/enums.dart';

import 'verify_sms_otp_controller.dart';

class VerifySMSOTPBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if(arg is SmsOTPType){
      Get.lazyPut<OtpRepo>(() => OtpRepoImpl(OtpServiceImpl()));
      Get.lazyPut<OtpUseCase>(() => OtpUseCase(Get.find()));
      Get.lazyPut(() => VerifySMSOTPController(arg));
    }

  }
}
