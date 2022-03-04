import 'package:get/get.dart';
import 'package:trading_module/data/repos/otp_repo_impl.dart';
import 'package:trading_module/data/services/otp_services.dart';
import 'package:trading_module/domain/repos/otp_repo.dart';
import 'package:trading_module/domain/use_cases/otp_use_case.dart';

import 'generate_otp_controller.dart';

class GenerateOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpRepo>(() => OtpRepoImpl(OtpServiceImpl()));
    Get.lazyPut<OtpUseCase>(() => OtpUseCase(Get.find()));
    Get.lazyPut(() => GenerateOtpController());
  }
}
