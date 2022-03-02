import 'package:get/get.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/pages/main_controller.dart';
import 'package:trading_module/pages/smart_otp/base_check_smart_otp.dart';
import 'package:trading_module/routes/app_pages.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';

class VerifyPolicyController extends BaseController with BaseCheckSmartOTP {
  final MainController _mainController = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  void acceptTerm() {
    if (!_mainController.userIsRegisteredKyc) {
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
                  }),
        ]));
  }

  @override
  void onActive() {
    Get.toNamed(AppRoutes.SMART_OPT_VERIFY_SMS);
  }

  void openPdf(int pos) {
    if (pos == 0) {
      Get.toNamed(AppRoutes.PDF_VIEW,
          arguments:
              "https://raw.githubusercontent.com/tienbm/DemoPdf-Flutter/main/demo.pdf");
    } else if (pos == 1) {
      Get.toNamed(AppRoutes.PDF_VIEW,
          arguments:
              "https://raw.githubusercontent.com/tienbm/DemoPdf-Flutter/main/demo.pdf");
    } else {
      Get.toNamed(AppRoutes.PDF_VIEW,
          arguments:
              "https://raw.githubusercontent.com/tienbm/DemoPdf-Flutter/main/demo.pdf");
    }
  }

  @override
  void onSkip() {
    // TODO: implement onSkip
  }
}
