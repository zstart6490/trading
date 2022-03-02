import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_project/cores/networking/result.dart';
import 'package:trading_project/pages/smart_otp/otp_expired_controller.dart';
import 'package:trading_project/routes/app_pages.dart';
import 'package:trading_project/routes/app_routes.dart';
import 'package:trading_project/utils/enums.dart';

class VerifySMSOTPController extends OtpExpiredController {
  final formKey = GlobalKey<FormState>();
  late TextEditingController textController;
  RxString otp = RxString("");
  Rx<Errors> errors = Errors.nullValue().obs;
  RxString desc = "Mã xác nhận OTP của bạn được gửi tới số điện thoại: ".obs;
  RxString descSecond = "".obs;

  @override
  void onInit() {
    textController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    reSendOTP();
    super.onReady();
  }

  void reSendOTP() {
    if (!(Get.isDialogOpen ?? true)) showProgressingDialog();
    //request sms
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
    hideDialog();
    //check result
    // if (result.success == true) {
    //   endTimer();
    onSuccess();
    // } else if (result.hasError) {
    //   errors.value = result.error!;
    // }
  }

  Future<void> onSuccess() async {
    // showProgressingDialog();
    //handle
    Get.toNamed(AppRoutes.SMART_OPT_CREATE);
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

  Future<void> generateOTP(SmartOTPType type) async {
    showProgressingDialog();
  }
}
