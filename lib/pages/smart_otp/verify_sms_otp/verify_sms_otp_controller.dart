import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/networking/result.dart';
import 'package:trading_module/data/entities/navigate_trans_detail.dart';
import 'package:trading_module/domain/entities/otp_confirm_model.dart';
import 'package:trading_module/domain/use_cases/otp_use_case.dart';
import 'package:trading_module/domain/use_cases/withdraw_usecase.dart';
import 'package:trading_module/pages/smart_otp/otp_expired_controller.dart';
import 'package:trading_module/pages/withdraw/confirm/withdraw_controller.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/extensions.dart';

class VerifySMSOTPController extends OtpExpiredController {
  final formKey = GlobalKey<FormState>();
  late TextEditingController textController;

  RxString otp = RxString("");
  Rx<Errors> errors = Errors.nullValue().obs;
  RxString desc = "Mã xác nhận OTP của bạn được gửi tới số điện thoại: ".obs;
  RxString descSecond = "".obs;

  Rx<bool> focusState = true.obs;

  final OtpUseCase _otpUseCase = Get.find();
  SmsOTPType type;

  VerifySMSOTPController(this.type);

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
    final otp = textController.text.removeAllWhitespace;
    if (type == SmsOTPType.cashOutTrading) {
      if (Get.isRegistered<WithdrawController>()) {
        final wc = Get.find<WithdrawController>();
        final cashOut = Get.find<WithdrawUseCase>();
        final withdrawInfo = wc.withdrawInfo;
        // final data = wc.data;
        if (withdrawInfo == null) return;
        showProgressingDialog();
        final result = await cashOut.confirmCashOut(
            otp: otp,
            otpMethod: OTPMethod.sms.name,
            tokenParent: dataAppParent.token,
            transactionId: withdrawInfo.transactionId.toString());
        hideDialog();
        if (result.data != null) {
          Get.offNamedUntil(AppRoutes.transactionDetail,
              ModalRoute.withName(AppRoutes.homeTrading),
              arguments:
                  NavigateTranDetail(transaction: result.data!, hasBtn: false));
        } else if (result.error != null) {
          showSnackBar(result.error!.message);
        }
      }
      return;
    }
    if (type == SmsOTPType.registerTrading) {
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
      } else {
        handleErrorResponse(result.error);
      }
    }
  }

  Future<void> onSuccess(OtpConfirmModel? data) async {
    // showProgressingDialog();
    //handle
    hideDialog();
    if (type == SmsOTPType.registerTrading) {
      Get.offNamedUntil(
        AppRoutes.contractPage,
        ModalRoute.withName("/home"),
        arguments: data?.contractLink ?? "",
      );
    }
  }

  Future<void> generateOTP() async {
    print("AAAA");
    final result = await _otpUseCase.generateOTP(
        "", mainProvider.dataInputApp.token, OTPMethod.sms.name);
    if (result.error != null) {
      print("VBBBB");
      focusState.value = false;
      final error = result.error!;
      if (error.code == BLOCK_OTP_1_CODE || error.code == BLOCK_OTP_2_CODE) {
        _showDialogNotify(error.message);
      } else {
        errors.value = error;
      }
    } else {
      print("CCCCC");
      endTimer();

    }
    startTimer(60);
  }

  void _showDialogNotify(String desc) {
    FocusManager.instance.primaryFocus?.unfocus();
    showAlertDialog(
        CustomAlertDialog(
          title: "Thông báo".tr,
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
}
