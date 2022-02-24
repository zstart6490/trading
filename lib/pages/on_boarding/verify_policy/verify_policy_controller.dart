import 'package:get/get.dart';
import 'package:trading_project/cores/states/base_controller.dart';
import 'package:trading_project/pages/smart_otp/base_check_smart_otp.dart';
import 'package:trading_project/routes/app_pages.dart';
import 'package:trading_project/shared_widgets/CustomAlertDialog.dart';

class VerifyPolicyController extends BaseController with BaseCheckSmartOTP{
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
      Get.toNamed(Routes.SMART_OPT_VERIFY_SMS);
  }

  @override
  void onSkip() {

  }
}
