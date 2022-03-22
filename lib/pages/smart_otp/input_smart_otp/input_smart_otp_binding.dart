import 'package:get/get.dart';
import 'package:trading_module/data/repos/otp_repo_impl.dart';
import 'package:trading_module/data/services/otp_services.dart';
import 'package:trading_module/domain/repos/otp_repo.dart';
import 'package:trading_module/domain/use_cases/otp_use_case.dart';
import 'package:trading_module/pages/smart_otp/input_smart_otp/input_smart_otp_controller.dart';
import 'package:trading_module/utils/enums.dart';

class InputSmartOTPBinding extends Bindings {
  @override
  void dependencies() {
    var arg = Get.arguments;
    if (arg is TradingSmartOTPType) {
      Get.lazyPut<OtpRepo>(() => OtpRepoImpl(OtpServiceImpl()));
      Get.lazyPut<OtpUseCase>(() => OtpUseCase(Get.find()));
      Get.lazyPut(() => InputSmartOTPController(arg));
    }
  }
}
