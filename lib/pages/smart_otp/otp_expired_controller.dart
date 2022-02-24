import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_project/cores/states/base_controller.dart';

class OtpExpiredController extends BaseController with WidgetsBindingObserver {
  Timer? _otpTimer;
  RxInt otpExpired = 60.obs;
  late DateTime startDate;
  OtpExpiredController();
  @override
  void onInit() {
    WidgetsBinding.instance?.addObserver(this);
    startDate = DateTime.now();
    super.onInit();
  }

  void startTimer(int expired) {
    otpExpired.value = expired;
    if (_otpTimer != null && _otpTimer!.isActive) _otpTimer!.cancel();
    startDate = DateTime.now().add(Duration(seconds: expired));
    _otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      log("onTimer : ${otpExpired.value}");
      otpExpired.value--;
      if (otpExpired.value <= 0) {
        _otpTimer!.cancel();
      }
    });
  }

  void endTimer() {
    _otpTimer?.cancel();
  }

  @override
  void onClose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.onClose();
    endTimer();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      checkPassedTime();
    }
  }

  void checkPassedTime() {
    final now = DateTime.now();
    final int passedSecond = startDate.difference(now).inSeconds;
    if (passedSecond > 0) {
      otpExpired.value = passedSecond;
    } else {
      otpExpired.value = 0;
      _otpTimer?.cancel();
    }
  }
}
