import 'package:get/get.dart';
import 'package:trading_project/cores/states/base_common_widget.dart';
import 'package:trading_project/pages/base/main_provider.dart';
import 'package:trading_project/shared_widgets/CustomAlertDialog.dart';
import 'package:trading_project/utils/enums.dart';

mixin BaseCheckSmartOTP on BaseCommonWidgets {
  MainProvider get mainProvider => GetInstance().find<MainProvider>();

  Future<void> checkSmartOTPState(SmartOTPType type) async {
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
