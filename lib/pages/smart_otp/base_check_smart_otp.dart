import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_common_widget.dart';
import 'package:trading_module/pages/main_provider.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';
import 'package:trading_module/utils/enums.dart';

mixin BaseCheckSmartOTP on BaseCommonWidgets {
  MainTradingProvider get mainProvider => GetInstance().find<MainTradingProvider>();

  Future<void> checkSmartOTPState() async {
    showProgressingDialog();
    // var isEnable = mainProvider.enableSmartOtp.value;
    // if (!isEnable) {
    //   isEnable = await _getSmartOTPState();
    // }
    // if (isEnable) {
    //   mainProvider.enableSmartOtp.value = true;
      hideDialog();
    // } else {
    //   hideDialog();
      _showPopupActiveSmartOTP();
    // }
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
                onSkip();
                hideDialog();
              }),
          AlertAction(
              text: "alert_active_now_smart_otp".tr,
              isDefaultAction: true,
              onPressed: () => {
                    //active smart OTP
                    onActive()
                  }),
        ]));
  }

  void onSkip();

  void onActive();
}
