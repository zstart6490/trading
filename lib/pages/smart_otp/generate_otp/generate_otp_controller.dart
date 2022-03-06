import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/use_cases/otp_use_case.dart';

class GenerateOtpController extends BaseController with WidgetsBindingObserver {

  late Timer _timer;
  RxBool canNext = false.obs;
  bool shouldReload = true;
  late DateTime startDate;

  final OtpUseCase _otpUseCase = Get.find();

  late RxString otp="".obs;

  RxInt second = 0.obs;


  @override
  Future<bool> onWillPop() {
    endTimer();
    return super.onWillPop();
  }

  @override
  void onInit() {
    WidgetsBinding.instance?.addObserver(this);
    super.onInit();
  }

  @override
  void onReady() {
    startTimer(60);
    reGenerateOTP();
    super.onReady();
  }

  @override
  void onClose() {
    endTimer();
    WidgetsBinding.instance?.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    log("GenerateOtpController $state", name: 'AppLifecycle');
    if (state == AppLifecycleState.resumed) {
      shouldReload = true;
      checkPassedTime();
    }
    if (state == AppLifecycleState.inactive) {
      shouldReload = false;
    }
  }

  void startTimer(int expired) {
    startDate = DateTime.now();
    second.value = expired;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      second--;
      log("Smart OTP: $second");
      if (second <= 0 && shouldReload) {
        reGenerateOTP();
        _timer.cancel();
        canNext.value = false;
      }
    });
  }

  void endTimer() {
    _timer.cancel();
  }

  Future<void> reGenerateOTP() async {
    showProgressingDialog();
    final result = await _otpUseCase.generateOTP(
        "1234", mainProvider.dataInputApp.token, OTPMethod.smart.name);
    hideDialog();
    if (result.data != null) {
      final otpTmp = result.data?.otp;
      if (otpTmp != null) {
        otp.value = otpTmp.toString();
        canNext.value = true;
        startTimer(60);
        update();
      } else {
        canNext.value = false;
        showSnackBar(UNKNOWN_ERROR);
      }
    } else if (result.error != null) {
      canNext.value = false;
      showSnackBar(result.error!.message);
    }
  }

  Future<void> onConfirm() async {
    endTimer();
    showProgressingDialog();
    final result = await _otpUseCase.confirmOTP(otp.value, OTPMethod.smart.toString(), mainProvider.dataInputApp.token);
    hideDialog();
  }

  void checkPassedTime() {
    final now = DateTime.now();
    final int passedSecond = 60 - now.difference(startDate).inSeconds;
    if (passedSecond > 0) {
      second.value = passedSecond;
    } else {
      second.value = 0;
      _timer.cancel();
      reGenerateOTP();
    }
  }
}
