import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/data/entities/kyc_status.dart';
import 'package:trading_module/data/entities/otp_status.dart';
import 'package:trading_module/domain/entities/user_data.dart';
import 'package:trading_module/domain/use_cases/user_onboarding_usecase.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';

class VerifyPolicyController extends BaseController {
  final UserOnBoardingUseCase _boardingUseCase =
  Get.find<UserOnBoardingUseCase>();

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
        mainProvider.accessToken =
            AccessToken(token: resp.data?.token ?? "", type: "register_user");
        mainProvider.userData = resp.data?.userData;
        if (dataInput.userIsRegisteredOTP == OtpStatus.disable) {
          //show alert yêu cầu
          _showPopupActiveSmartOTP();
        } else {
          //call qua tikop kich hoat otp ngay
          mainProvider.callToActiveOTP?.call();
        }
      }
    } else {
      if (dataInput.userIsRegisteredKyc == KycStatus.none) {
        showPopupRequiredKYC();
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
              }),
          AlertAction(
              text: "alert_active_now_smart_otp".tr,
              isDefaultAction: true,
              onPressed: () => {
              //active smart OTP
              //call qua tikop kich hoat otp ngay
              mainProvider.callToActiveOTP?.call()
          }),
        ]));
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
                mainProvider.callToEKYC?.call(),
              }),
        ]));
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

  void showDialogKycPending() {
    showAlertDialog(CustomAlertDialog(
        title: "verify_account".tr,
        desc: "dialog_kyc_pending".tr,
        actions: [
          AlertAction(
              text: "i_understand".tr,
              isDefaultAction: true,
              onPressed: () =>
              {
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
