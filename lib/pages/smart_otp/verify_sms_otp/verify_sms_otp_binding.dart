import 'package:get/get.dart';
import 'package:trading_project/data/repos/otp_repo_impl.dart';
import 'package:trading_project/data/services/otp_services.dart';
import 'package:trading_project/domain/repos/otp_repo.dart';
import 'package:trading_project/domain/use_cases/otp_use_case.dart';

import 'verify_sms_otp_controller.dart';

class VerifySMSOTPBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    Get.lazyPut<OtpRepo>(() => OtpRepoImpl(OtpServiceImpl("token")));
    Get.lazyPut<OtpUseCase>(() => OtpUseCase(Get.find()));
    Get.lazyPut(() => VerifySMSOTPController());
  }
}
