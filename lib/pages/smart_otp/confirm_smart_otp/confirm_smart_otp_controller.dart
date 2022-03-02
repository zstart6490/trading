import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/routes/app_pages.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/utils/enums.dart';

class ConfirmSmartOtpController extends BaseController {
  String errorText = "Mã PIN không trùng khớp";
  TextEditingController textEditingController = TextEditingController();
  RxBool isError = false.obs;
  String desc = "Xin vui lòng nhập lại mã PIN cho Smart OTP";
  final FocusNode focusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void hideKeyboard() {
    //Không cho ẩn bàn phím
    // super.hideKeyboard();
  }

  Future<void> notMatchPin() async {
    isError.value = true;
    await DUR_500.delay();
    textEditingController.clear();
    focusNode.requestFocus();
  }

  Future<void> onMatchPin(SmartOTPType type) async {}

  void onChanged(String pin) {
    if (pin.length == 4) {
      Get.toNamed(AppRoutes.SMART_OPT_GENERATE);
    }
  }
}
