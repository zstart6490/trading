import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/kyc/kyc_callback.dart';
import 'package:trading_module/pages/main_controller.dart';
import 'package:trading_module/pages/smart_otp/base_check_smart_otp.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';

class VerifyPolicyController extends BaseController
    with BaseCheckSmartOTP, KycResultCallback {
  void acceptTerm() {
    if (mainProvider.userIsRegisteredKyc == KycStatus.kycFail) {
      showPopupRequiredKYC();
    } else {}
  }

  void showPopupRequiredKYC() {
    showAlertDialog(CustomAlertDialog(
        title: "verify_account".tr,
        desc: "content_alert_verify_account".tr,
        actions: [
          AlertAction(text: "cancel".tr, onPressed: () => hideDialog()),
          AlertAction(
              text: "button_verify_alert".tr,
              isDefaultAction: true,
              onPressed: () => {
                    //call to KYC tikop
                    kycAction?.onOpenKyc(),
                    hideDialog()
                  }),
        ]));
  }

  @override
  void onActive() {
    Get.toNamed(AppRoutes.SMART_OPT_VERIFY_SMS);
  }

  void openPdf(String name, int pos) {
    if (pos == 0) {
      Get.toNamed(AppRoutes.PDF_VIEW, arguments: [
        name,
        "https://raw.githubusercontent.com/tienbm/DemoPdf-Flutter/main/demo.pdf"
      ]);
    } else if (pos == 1) {
      Get.toNamed(AppRoutes.PDF_VIEW, arguments: [
        name,
        "https://raw.githubusercontent.com/tienbm/DemoPdf-Flutter/main/demo.pdf"
      ]);
    } else {
      Get.toNamed(AppRoutes.PDF_VIEW, arguments: [
        name,
        "https://raw.githubusercontent.com/tienbm/DemoPdf-Flutter/main/demo.pdf"
      ]);
    }
  }

  @override
  void onSkip() {
    // TODO: implement onSkip
  }

  @override
  void onResultKyc(KycStatus kycStatus) {
    if (kycStatus == KycStatus.kycSuccess) {
      print("kyc success");
      mainProvider.userIsRegisteredKyc = kycStatus;
    }
    if (kycStatus == KycStatus.kycFail) {
      print("kyc kycFail");
    }
  }
}
