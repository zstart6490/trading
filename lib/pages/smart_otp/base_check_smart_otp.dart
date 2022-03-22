import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_common_widget.dart';
import 'package:trading_module/data/entities/otp_status.dart';
import 'package:trading_module/pages/main_provider.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';
import 'package:trading_module/utils/enums.dart';

mixin BaseCheckSmartOTP on BaseCommonWidgets {
  MainTradingProvider get mainProvider =>
      GetInstance().find<MainTradingProvider>();

  Future<void> checkSmartOTPState(TradingSmartOTPType smartOTPType) async {
    showProgressingDialog();
    final isEnable =
        mainProvider.dataInputApp.userIsRegisteredOTP == OtpStatus.enable;
    // if (!isEnable) {
    //   isEnable = await _getSmartOTPState();
    // }
    print("isEnableOTP=$isEnable");
    if (isEnable) {
      // mainProvider.enableSmartOtp.value = true;
      // final isBlock = await _smartOTPIsBlock();
      hideDialog();
      // if (!isBlock) {
      //   Get.toNamed(AppRoutes.smartOtpInput, arguments: type);
      Get.toNamed(AppRoutes.smartOtpInput,arguments: smartOTPType);
      // }
    } else {
      hideDialog();
      _showPopupActiveSmartOTP();
    }
  }

  Future<bool> _getSmartOTPState() async {
    //call api check state
    return false;
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
                onSkip();
              }),
          AlertAction(
              text: "alert_active_now_smart_otp".tr,
              isDefaultAction: true,
              onPressed: () => {hideDialog(), onActive()}),
        ]));
  }

  void onSkip();

  void onActive();
}
