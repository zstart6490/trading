import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/data/entities/kyc_status.dart';
import 'package:trading_module/domain/entities/data_login.dart';
import 'package:trading_module/domain/use_cases/user_onboarding_usecase.dart';
import 'package:trading_module/pages/smart_otp/base_check_smart_otp.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';
import 'package:trading_module/utils/enums.dart';

class VerifyPolicyController extends BaseController with BaseCheckSmartOTP {
  final UserOnBoardingUseCase _boardingUseCase =
      Get.find<UserOnBoardingUseCase>();



  final DataLogin? dataLogin;

  VerifyPolicyController({this.dataLogin});


  Future acceptTermAndVerify() async {
    final dataInput = mainProvider.dataInputApp;
    if (dataInput.userIsRegisteredKyc == KycStatus.verified) {
      showProgressingDialog();
      final resp = await _boardingUseCase.registerTrading(
          dataInput.email ?? "",
          "y",
          dataInput.phone ?? "",
          dataInput.phoneCountryCode ?? "",
          dataInput.token);
      hideDialog();
      if (resp.data != null) {
        //SUCCESS
        mainProvider.accessToken = resp.data?.token;
        // mainProvider.userData = resp.data?.userData;
       await checkSmartOTPState(TradingSmartOTPType.registerTrading);
      } else {
        handleErrorResponse(resp.error);
      }
    } else {
      if (dataInput.userIsRegisteredKyc == KycStatus.none) {
        showPopupRequiredKYC(
            "verify_account".tr, "content_alert_verify_account".tr);
      } else if (dataInput.userIsRegisteredKyc == KycStatus.reject) {
        showPopupRequiredKYC("ekyc_reject_title".tr, "ekyc_reject_content".tr);
      } else if (dataInput.userIsRegisteredKyc == KycStatus.pending) {
        showDialogKycPending();
      }
    }
  }

  void showPopupRequiredKYC(String title, String content) {
    showAlertDialog(CustomAlertDialog(title: title, desc: content, actions: [
      AlertAction(
          text: "cancel".tr,
          onPressed: () {
            hideDialog();
            // Get.toNamed(AppRoutes.SMART_OPT_VERIFY_SMS);
          }),
      AlertAction(
          text: "button_verify_alert".tr,
          isDefaultAction: true,
          onPressed: () => {
                //call to KYC tikop
                hideDialog(),
                mainProvider.callToEKYC?.call(),
              }),
    ]));
  }

  void openPdf(String name, int pos) {
    // Get.toNamed(AppRoutes.SMART_OPT_VERIFY_SMS);
    if (pos == 0) {
      Get.toNamed(AppRoutes.pdfView,
          arguments: [name, dataLogin?.configMap?.obTermUsageLink ?? ""]);
    } else if (pos == 1) {
      Get.toNamed(AppRoutes.pdfView,
          arguments: [name, dataLogin?.configMap?.obTermAccountLink ?? ""]);
    } else {
      Get.toNamed(AppRoutes.pdfView,
          arguments: [name, dataLogin?.configMap?.obTermStockLink ?? ""]);
    }
  }

  void showDialogKycPending() {
    showAlertDialog(CustomAlertDialog(
        title: "verify_account".tr,
        desc: "dialog_kyc_pending".tr,
        actions: [
          AlertAction(
              text: "i_understand".tr,
              isDefaultAction: true,
              onPressed: () => {
                    //call to KYC tikop
                    hideDialog(),
                  }),
        ]));
  }

  void setStatusEKYCAndVerifyNext(KycStatus? kycStatus) {
    if (kycStatus != null) {
      mainProvider.dataInputApp.userIsRegisteredKyc = kycStatus;
      acceptTermAndVerify();
    }
  }

  @override
  void onActive() {
    mainProvider.callToActiveOTP?.call(TradingSmartOTPType.registerTrading);
  }

  @override
  void onSkip() {
    Get.toNamed(AppRoutes.smartOtpVerifySms,
        arguments: SmsOTPType.registerTrading);
  }

  void gotoHomeParent() {
    Get.back();
    Get.back();
    // Get.offAllNamed(AppRoutes.homeParent);
  }
}
