import 'package:get/get.dart';
import 'package:trading_module/data/repos/onboarding_repos_impl.dart';
import 'package:trading_module/data/repos/otp_repo_impl.dart';
import 'package:trading_module/data/services/onboarding_service.dart';
import 'package:trading_module/data/services/otp_services.dart';
import 'package:trading_module/domain/entities/data_login.dart';
import 'package:trading_module/domain/use_cases/otp_use_case.dart';
import 'package:trading_module/domain/use_cases/user_onboarding_usecase.dart';
import 'package:trading_module/pages/on_boarding/verify_policy/verify_policy_controller.dart';

class VerifyPolicyBinding extends Bindings {
  @override
  void dependencies() {
    final params = Get.arguments as List;
    final DataLogin? dataLogin = params[0]['data_login'] as DataLogin?;
    Get.lazyPut(() =>
        UserOnBoardingUseCase(OnBoardingReposImpl(OnBoardingServiceImpl())));
    Get.lazyPut(() => VerifyPolicyController(dataLogin: dataLogin));
    Get.lazyPut<OtpUseCase>(() => OtpUseCase(OtpRepoImpl(OtpServiceImpl())));
  }
}
