import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/use_cases/otp_use_case.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';
import 'package:trading_module/utils/enums.dart';

class GenerateOtpController extends BaseController with WidgetsBindingObserver {
  final String pin;
  final String initOTP;
  final SmartOTPType type;
  late Timer _timer;
  RxBool canNext = true.obs;
  bool shouldReload = true;
  late DateTime startDate;

  final OtpUseCase _otpUseCase = Get.find();

  late RxString otp = "".obs;

  RxInt second = 0.obs;

  GenerateOtpController(
      {required this.pin, required this.initOTP, required this.type}) {
    otp = initOTP.obs;
  }

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
    setupData();
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

  void setupData() {
    switch (type) {
      case SmartOTPType.create:
        {
          canNext.value = true;
          startTimer(60);
        }
        break;
      case SmartOTPType.tikop:
        {
          canNext.value = false;
          reGenerateOTP();
        }
        break;
    }
  }

  void startTimer(int expired) {
    startDate = DateTime.now();
    second.value = expired;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      second--;
      log("Smart OTP: $second");
      if (second <= 0 && shouldReload) {
        //if (second <= 0) {
        reGenerateOTP();
        _timer.cancel();
        canNext.value = false;
        log("$second");
      }
    });
  }

  void endTimer() {
    _timer.cancel();
  }

  Future<void> reGenerateOTP() async {
    showProgressingDialog();
    final result = await _otpUseCase.generateOTP(
        pin, mainProvider.dataInputApp.token, OTPMethod.smart.name);
    hideDialog();
    if (result.data != null) {
      final otpTmp = result.data?.otp;
      if (otpTmp != null) {
        otp.value = otpTmp;
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
    final result = await _otpUseCase.confirmOTP(
        otp.value, OTPMethod.smart.name, mainProvider.dataInputApp.token);
    hideDialog();
    if (result.data?.state == "VALID") {
      Get.toNamed(AppRoutes.CONTRACT);
    } else if (result.error != null) {
      if (result.error!.code == 101) {
        _showDialogNotify(result.error!.message);
      } else {
        showSnackBar(result.error!.message);
      }
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
        name: "GenerateOtpController", canDissmiss: false);
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
