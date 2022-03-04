import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/data/entities/kyc_status.dart';
import 'package:trading_module/data/entities/otp_status.dart';
import 'package:trading_module/domain/use_cases/user_onboarding_usecase.dart';
import 'package:trading_module/kyc/kyc_callback.dart';
import 'package:trading_module/pages/smart_otp/base_check_smart_otp.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';

class VerifyPolicyController extends BaseController
    with BaseCheckSmartOTP, KycResultCallback {

  final UserOnBoardingUseCase _boardingUseCase = Get.find<
      UserOnBoardingUseCase>();

  void acceptTerm() {
    if (mainProvider.dataInputApp.userIsRegisteredKyc == KycStatus.none) {
      showPopupRequiredKYC();
    } else if (mainProvider.dataInputApp.userIsRegisteredOTP==OtpStatus.disable) {
      // show otp dialog
      checkSmartOTPState();
    } else {
      // _boardingUseCase.registerTrading(
      //     email, kyc, phone, phoneCountryCode, token)
    }
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
              onPressed: () =>
              {
                //call to KYC tikop
                hideDialog(),
                kycAction?.onOpenKyc(),
              }),
        ]));
  }

  @override
  void onActive() {
    hideDialog();
    Get.toNamed(AppRoutes.SMART_OPT_VERIFY_SMS);
  }

  void openPdf(String name, int pos) {
    Get.toNamed(AppRoutes.SMART_OPT_VERIFY_SMS);
    // if (pos == 0) {
    //   Get.toNamed(AppRoutes.PDF_VIEW, arguments: [
    //     name,
    //     "https://raw.githubusercontent.com/tienbm/DemoPdf-Flutter/main/demo.pdf"
    //   ]);
    // } else if (pos == 1) {
    //   Get.toNamed(AppRoutes.PDF_VIEW, arguments: [
    //     name,
    //     "https://raw.githubusercontent.com/tienbm/DemoPdf-Flutter/main/demo.pdf"
    //   ]);
    // } else {
    //   Get.toNamed(AppRoutes.PDF_VIEW, arguments: [
    //     name,
    //     "https://raw.githubusercontent.com/tienbm/DemoPdf-Flutter/main/demo.pdf"
    //   ]);
    // }
  }

  @override
  void onSkip() {}

  @override
  void onResultKyc(KycStatus kycStatus) {
    if (kycStatus == KycStatus.verified) {
      print("kyc success");
      mainProvider.dataInputApp.userIsRegisteredKyc = kycStatus;
    }
    if (kycStatus == KycStatus.none) {
      print("kyc kycFail");
    }
  }
}
