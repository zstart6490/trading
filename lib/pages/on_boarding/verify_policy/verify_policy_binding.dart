import 'package:get/get.dart';
import 'package:trading_project/domain/entities/data_login.dart';
import 'package:trading_project/pages/on_boarding/verify_policy/verify_policy_controller.dart';

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
    Get.lazyPut(() => VerifyPolicyController());
  }
}
