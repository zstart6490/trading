import 'package:get/get.dart';
import 'package:trading_module/pages/on_boarding/verify_policy/verify_policy_controller.dart';

abstract class KycCallback {
  void onOpenKyc();
}

late KycCallback? kycAction;

void setKycCallback(KycCallback kycCallback) {
  kycAction = kycCallback;
}

abstract class KycResultCallback {
  void onResultKyc(KycStatus kycStatus);
}

enum KycStatus { kycSuccess,kycWait, kycFail }

void resultKyc(KycStatus kycStatus) {
  Get.find<VerifyPolicyController>().onResultKyc(kycStatus);
}
