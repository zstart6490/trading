import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_common_widget.dart';
import 'package:trading_module/data/entities/otp_status.dart';
import 'package:trading_module/domain/use_cases/otp_use_case.dart';
import 'package:trading_module/pages/main_provider.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';
import 'package:trading_module/utils/enums.dart';

mixin BaseCheckSmartOTP on BaseCommonWidgets {
  MainTradingProvider get mainProvider =>
      GetInstance().find<MainTradingProvider>();

  final OtpUseCase _otpUseCase = Get.find<OtpUseCase>();

  Future<void> checkSmartOTPState(TradingSmartOTPType smartOTPType) async {
    showProgressingDialog();
    final isEnable =
        mainProvider.dataInputApp.userIsRegisteredOTP == OtpStatus.enable;

    if (isEnable) {
      final isBlock = await _smartOTPIsBlock();
      hideDialog();
      if (!isBlock) {
        Get.toNamed(AppRoutes.smartOtpInput, arguments: smartOTPType);
      }
    } else {
      hideDialog();
      _showPopupActiveSmartOTP();
    }
  }

  Future<bool> _smartOTPIsBlock() async {
    final resultOtp =
        await _otpUseCase.smartOTPIsBlock(mainProvider.dataInputApp.token);
    if (resultOtp.error == null && resultOtp.data == null) {
      return true;
    }
    if (resultOtp.data?.isBlock ?? false) {
      _showDialogNotify(
          "Tài khoản của bạn đang tạm thời bị khóa xác nhận bằng OTP trong vòng 60 phút. Vui lòng quay lại sau!");
      return true;
    }
    if (resultOtp.error != null) {
      _showDialogNotify(resultOtp.error!.message);
      return true;
    }
    return false;
  }

  void _showDialogNotify(String desc) {
    showAlertDialog(
        CustomAlertDialog(
          title: "Tài khoản tạm khóa OTP",
          desc: desc,
          actions: [
            AlertAction.ok(() {
              hideDialog();
              // Get.back();
            })
          ],
        ),
        dismissable: false,
        onCompleted: () => Get.back());
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
