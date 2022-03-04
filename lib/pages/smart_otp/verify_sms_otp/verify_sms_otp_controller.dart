import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/networking/result.dart';
import 'package:trading_module/domain/use_cases/otp_use_case.dart';
import 'package:trading_module/pages/smart_otp/otp_expired_controller.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/utils/enums.dart';

class VerifySMSOTPController extends OtpExpiredController {
  final formKey = GlobalKey<FormState>();
  late TextEditingController textController;

  RxString otp = RxString("");
  Rx<Errors> errors = Errors.nullValue().obs;
  RxString desc = "Mã xác nhận OTP của bạn được gửi tới số điện thoại: ".obs;
  RxString descSecond = "(+84)973591728".obs;

  final OtpUseCase _otpUseCase = Get.find();
  final String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJiaXJ0aGRheSI6IjIwMjIvMDIvMjMiLCJwaG9uZU51bWJlciI6IjA5NzM1OTE3MjgiLCJhZGRyZXNzIjoiVGF5IEhhIFRvd2VyLCAxOCBUbyBIdXUsIE5hbSBUdSBMaWVtLCBIYSBOb2ksIFZpZXQgTmFtZSIsImdlbmRlciI6IjAiLCJuYW1lIjoiMDk3MzU5MTcyOCIsImlkIjoxMjEsImV4cCI6MTY0NjI5NjcyNCwidXVpZCI6ImM3M2ViMDllLTQ2Y2ItNDUxNC05YmExLTljOGZhMTJmMjVkOSIsImVtYWlsIjoidHJhZGluZ0B0ZWNobGFiLmFpIn0.50HWCUU-GYlj-UUUJ7No0dy8HH_6ftP1ibJhvLfVptN15rbCNkqJEnKasPXgLGCKtCcRXyKSk0rnr2xHCJ5-eeO3UbU5LXJZuqmrrL2R0O6Xm6NCSc2NFeiNR94cTU3VjKOpBHxXuyL8vqe3Fst8aknvGY8qsJNcuGZ450khwGl9xHtlpaVyPafssvXU6ClaJSQP9OoGlT9PZJ_f2eJ4meUT27UU289t9n48t117od_fBGdiJ-1vdOIFCoOhL2E4BB8H8OPsY8lnkGZDvxNT6rPBRC0DAiMGhwu4o6G5scJfNDeETjssZ4-_CtqyzaHlD4cFTQeHTwm72idqYPvx4DOxQ-IEhlNFhpKcW-Qzh7fLLnl5beIU5JVBM7-Llb2GRaTqbKQiFqrFT45YEQnefTFzI5fkogc3RTVZtMIrVij7AahJ18RD_XSiHxD-LrZizveXVFmGibqlcmyqferVYgBGKFaAGlCLTuzka2Mh6Yx9uXfMU7YIo4I_WrZ-4b3FXo9TSfJV4E_SKXDcMkrBXDFghBovmPAJGHthRN1eDEI0XI49psW_8Dx_1AxAXXCxg8rNL0mLU8CM_R7i7Fz_C-Mnz-nXZheT_93G5ZOtBuXcnQv0L2vzq2k0WECMONtUd1emvefWAE9MF1RCJy9KQvWrMpPe7q_Wh8eaO_hig_w";

  @override
  void onInit() {
    textController = TextEditingController();
    super.onInit();

    final result = _otpUseCase.generateOTP("1234",token, OTPMethod.sms.toString());
  }

  @override
  void onReady() {
    reSendOTP();
    super.onReady();
  }

  void reSendOTP() {
    //if (!(Get.isDialogOpen ?? true)) showProgressingDialog();
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
    final result = await _otpUseCase.generateOTP(otp, token, OTPMethod.sms.toString());
    if (result is Errors){
      errors.value = (result as Errors);
    }else{
      endTimer();
      onSuccess();
    }
    hideDialog();
    //check result
    // if (result.success == true) {
    //   endTimer();
    //onSuccess();
    // } else if (result.hasError) {
    //   errors.value = result.error!;
    // }
  }

  Future<void> onSuccess() async {
    // showProgressingDialog();
    //handle
    Get.toNamed(AppRoutes.SMART_OPT_VERIFY_SMS);
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
    //showProgressingDialog();
  }
}
