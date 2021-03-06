import 'package:get/get.dart';
import 'package:trading_module/data/repos/otp_repo_impl.dart';
import 'package:trading_module/data/services/otp_services.dart';
import 'package:trading_module/domain/use_cases/otp_usecase.dart';
import 'package:trading_module/pages/smart_otp/input_smart_otp/input_smart_otp_controller.dart';
import 'package:trading_module/utils/enums.dart';

class InputSmartOTPBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is TradingSmartOTPType) {
      Get.lazyPut<OtpUseCase>(() => OtpUseCase(OtpRepoImpl(OtpServiceImpl())));
      Get.lazyPut(() => InputSmartOTPController(arg));
    }
  }
}
