import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/data/entities/kyc_status.dart';
import 'package:trading_module/data/entities/otp_status.dart';
import 'package:trading_module/domain/entities/data_login.dart';
import 'package:trading_module/domain/entities/user_data.dart';
import 'package:trading_module/domain/use_cases/user_onboarding_usecase.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';

class VerifyPolicyController extends BaseController {
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
        mainProvider.accessToken = AccessToken(token: resp.data?.token ?? "");
        mainProvider.userData = resp.data?.userData;
        if (dataInput.userIsRegisteredOTP == OtpStatus.disable) {
          //show alert yêu cầu
          _showPopupActiveSmartOTP();
        } else {
          //call qua tikop kich hoat otp ngay
          //mainProvider.callToActiveOTP?.call();
          Get.offAndToNamed(AppRoutes.SMART_OPT_INPUT);
          // mainProvider.callToForgetPin?.call();
        }
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

  void _showPopupActiveSmartOTP() {
    showAlertDialog(CustomAlertDialog(
        title: "alert_title_active_smart_otp".tr,
        desc: "alert_content_active_smart_otp".tr,
        actions: [
          AlertAction(
              text: "skip".tr,
              onPressed: () {
                hideDialog();
                Get.toNamed(AppRoutes.SMART_OPT_VERIFY_SMS);
              }),
          AlertAction(
              text: "alert_active_now_smart_otp".tr,
              isDefaultAction: true,
              onPressed: () => {
                    hideDialog(),
                    //active smart OTP
                    //call qua tikop kich hoat otp ngay
                    mainProvider.callToActiveOTP?.call()
                  }),
        ]));
  }

  void showPopupRequiredKYC(String title, String content) {
    showAlertDialog(CustomAlertDialog(title: title, desc: content, actions: [
      AlertAction(
          text: "cancel".tr,
          onPressed: () {
            hideDialog();
            Get.toNamed(AppRoutes.SMART_OPT_VERIFY_SMS);
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
    Get.toNamed(AppRoutes.SMART_OPT_VERIFY_SMS);
    // if (pos == 0) {
    //   Get.toNamed(AppRoutes.PDF_VIEW, arguments: [
    //     name,
    //     dataLogin?.configMap?.obTermUsageLink??""
    //   ]);
    // } else if (pos == 1) {
    //   Get.toNamed(AppRoutes.PDF_VIEW, arguments: [
    //     name,
    //     dataLogin?.configMap?.obTermAccountLink??""
    //   ]);
    // } else {
    //   Get.toNamed(AppRoutes.PDF_VIEW, arguments: [
    //     name,
    //     dataLogin?.configMap?.obTermStockLink?? ""
    //   ]);
    // }
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
}
