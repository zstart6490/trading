import 'package:get/get.dart';
import 'package:trading_module/domain/entities/data_login.dart';
import 'package:trading_module/kyc/kyc_callback.dart';
import 'package:trading_module/pages/on_boarding/intro/intro_controller.dart';

class IntroBinding extends Bindings {

  @override
  void dependencies() {
    final params = Get.arguments as List;
    final KycStatus userIsRegisteredKyc = params[0]['user_kyc'] as KycStatus;
    final bool userIsRegisteredOTP = params[0]['user_otp'] as bool;
    final DataLogin? dataLogin = params[0]['data_login'] as DataLogin?;

    Get.lazyPut(() =>
        IntroController(userIsRegisteredKyc: userIsRegisteredKyc,userIsRegisteredOTP:  userIsRegisteredOTP,dataLogin:  dataLogin));
  }
}
