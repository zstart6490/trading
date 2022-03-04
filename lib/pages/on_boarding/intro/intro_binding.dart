import 'package:get/get.dart';
import 'package:trading_module/data/entities/kyc_status.dart';
import 'package:trading_module/data/entities/otp_status.dart';
import 'package:trading_module/domain/entities/data_login.dart';
import 'package:trading_module/pages/on_boarding/intro/intro_controller.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    final params = Get.arguments as List;
    final KycStatus userIsRegisteredKyc = params[0]['user_kyc'] as KycStatus;
    final OtpStatus userIsRegisteredOTP = params[0]['user_otp'] as OtpStatus;
    final DataLogin? dataLogin = params[0]['data_login'] as DataLogin?;

    Get.lazyPut(() => IntroController(
        userIsRegisteredKyc: userIsRegisteredKyc,
        userIsRegisteredOTP: userIsRegisteredOTP,
        dataLogin: dataLogin));
  }
}
