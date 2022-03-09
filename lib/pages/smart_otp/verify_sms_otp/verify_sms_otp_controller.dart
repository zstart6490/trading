import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/dialog/dialog_route.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/networking/result.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/use_cases/otp_use_case.dart';
import 'package:trading_module/pages/main_provider.dart';
import 'package:trading_module/pages/smart_otp/otp_expired_controller.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/extensions.dart';

import '../../../shared_widgets/CustomAlertDialog.dart';

class VerifySMSOTPController extends OtpExpiredController {
  final formKey = GlobalKey<FormState>();
  late TextEditingController textController;

  RxString otp = RxString("");
  Rx<Errors> errors = Errors.nullValue().obs;
  RxString desc = "Mã xác nhận OTP của bạn được gửi tới số điện thoại: ".obs;
  RxString descSecond = "".obs;

  final OtpUseCase _otpUseCase = Get.find();

  @override
  MainTradingProvider get mainProvider => Get.find<MainTradingProvider>();

  @override
  void onInit() {
    textController = TextEditingController();
    descSecond.value = mainProvider.dataInputApp.phone!.phoneWithDialCode(mainProvider.dataInputApp.phoneCountryCode!);
    startTimer(60);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    generateOTP();
  }

  void reSendOTP() async {
    //if (!(Get.isDialogOpen ?? true)) showProgressingDialog();
    //request sms
    startTimer(60);
    generateOTP();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Future<bool> onWillPop() {
    return super.onWillPop();
  }

  void onChangeOTP(String value) {
    otp.value = value;
    if (value.isEmpty) {
      errors.value = Errors.nullValue();
    }
  }

  Future<void> verifyOTP(String otp) async {
    showProgressingDialog();
    //call api verify otp
    final result = await _otpUseCase.confirmOTP(
        otp, OTPMethod.sms.name, mainProvider.dataInputApp.token);
    hideDialog();
    if (result.error != null) {
      final error = result.error!;
      if (error.code == 101) {
        showDialogNotify(error.message);
      } else {
        errors.value = error;
      }
    } else if (result.data?.state == "VALID") {
      endTimer();
      onSuccess();
    }
  }

  Future<void> onSuccess() async {
    // showProgressingDialog();
    //handle
    Get.offNamed(AppRoutes.CONTRACT);
    hideDialog();
  }

  Future<void> showAlert(SmartOTPType type) async {
    switch (type) {
      case SmartOTPType.create:
        showSnackBar("Kích hoạt Smart OTP thành công",
            type: SnackBarType.success);
        break;
      default:
    }
  }

  Future<void> generateOTP() async {
    final result = await _otpUseCase.generateOTP(
        "", mainProvider.dataInputApp.token, OTPMethod.sms.name);
    if (result.error != null) {
      final error = result.error!;
      if (error.code == 101) {
        showDialogNotify(error.message);
      } else {
        errors.value = error;
      }
    } else {
      endTimer();
    }
  }

  void showDialogNotify(String desc) {
    final dialog = CustomAlertDialog(
      title: "Thông báo".tr,
      desc: desc,
      actions: [
        AlertAction.ok(() {
          hideDialog();
        })
      ],
    );
    showMessageDialog(dialog, name: AppRoutes.SMART_OPT_VERIFY_SMS, canDissmiss: false);
  }

}
