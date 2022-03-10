import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/networking/result.dart';
import 'package:trading_module/domain/entities/otp_confirm_model.dart';
import 'package:trading_module/domain/use_cases/otp_use_case.dart';
import 'package:trading_module/pages/main_provider.dart';
import 'package:trading_module/pages/smart_otp/otp_expired_controller.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';
import 'package:trading_module/utils/extensions.dart';


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
    descSecond.value = mainProvider.dataInputApp.phone!
        .phoneWithDialCode(mainProvider.dataInputApp.phoneCountryCode!);
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
      if (error.code == BLOCK_OTP_1_CODE || error.code == BLOCK_OTP_2_CODE) {
        _showDialogNotify(error.message);
      } else {
        errors.value = error;
      }
    } else if (result.data?.state == "VALID") {
      endTimer();
      onSuccess(result.data);
    }
  }

  Future<void> onSuccess(OtpConfirmModel? data) async {
    // showProgressingDialog();
    //handle
    hideDialog();
    Get.offNamedUntil(
      AppRoutes.CONTRACT,
      ModalRoute.withName("/home"),
      arguments: data?.contractLink ?? "",
    );
  }


  Future<void> generateOTP() async {
    final result = await _otpUseCase.generateOTP(
        "", mainProvider.dataInputApp.token, OTPMethod.sms.name);
    if (result.error != null) {
      final error = result.error!;
      if (error.code == BLOCK_OTP_1_CODE || error.code == BLOCK_OTP_2_CODE) {
        _showDialogNotify(error.message);
      } else {
        errors.value = error;
      }
    } else {
      endTimer();
    }
  }

  void _showDialogNotify(String desc) {
    final dialog = CustomAlertDialog(
      title: "Thông báo".tr,
      desc: desc,
      actions: [
        AlertAction.ok(() {
          hideDialog();
        })
      ],
    );
    showMessageDialog(dialog,
        name: AppRoutes.SMART_OPT_VERIFY_SMS, canDissmiss: false);
  }
}
