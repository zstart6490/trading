import 'package:get/get.dart';
import 'package:trading_module/data/repos/onboarding_repos_impl.dart';
import 'package:trading_module/data/services/onboarding_service.dart';
import 'package:trading_module/domain/use_cases/user_onboarding_usecase.dart';
import 'package:trading_module/pages/on_boarding/verify_policy/verify_policy_controller.dart';

class VerifyPolicyBinding extends Bindings {
  @override
  void dependencies() {
    // final params = Get.arguments as List;
    // final bool userIsRegisteredKyc = params[0]['user_kyc'] as bool;
    // final bool userIsRegisteredOTP = params[0]['user_otp'] as bool;
    // final DataLogin? dataLogin = params[0]['data_login'] as DataLogin?;
    //
    // Get.lazyPut(() =>
    //     VerifyPolicyController(userIsRegisteredKyc: userIsRegisteredKyc,userIsRegisteredOTP:  userIsRegisteredOTP,dataLogin:  dataLogin));
    Get.lazyPut(() =>
        UserOnBoardingUseCase(OnBoardingReposImpl(OnBoardingServiceImpl())));
    Get.lazyPut(() => VerifyPolicyController());
  }
}
