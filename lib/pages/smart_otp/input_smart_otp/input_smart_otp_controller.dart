import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_project/cores/states/base_controller.dart';
import 'package:trading_project/routes/app_pages.dart';
import 'package:trading_project/utils/enums.dart';

class InputSmartOTPController extends BaseController {
  RxBool isError = false.obs;
  final SmartOTPType type;
  late FocusNode focusNode;
  late TextEditingController textEditingController;
  RxString errorText = "".obs;
  // final SmartOTPRepository _smartOTPRepository = SmartOTPRepository();

  InputSmartOTPController(this.type);

  @override
  void hideKeyboard() {
    //Không cho ẩn bàn phím
    // super.hideKeyboard();
  }

  @override
  void onInit() {
    focusNode = FocusNode();
    textEditingController = TextEditingController();
    super.onInit();
  }

  Future<void> onChanged(String pin) async {
    if (pin.length == 4) {
      Get.toNamed(Routes.SMART_OPT_GENERATE);
      //showProgressingDialog();
      // final result = await _smartOTPRepository.generateOTP(pin);
      //hideDialog();
    //   if (result.success) {
    //     isError.value = false;
    //     errorText.value = "";
    //     final clonePin = pin;
    //     final otp = result.data["otp"];
    //     final cloneType = type;
    //     if (otp != null) {
    //       Get.offNamed(Routes.generateOtp, arguments: [
    //         clonePin,
    //         otp.toString(),
    //         cloneType,
    //       ]);
    //     } else {
    //       showSnackBar(UNKNOWN_ERROR);
    //     }
    //   } else if (result.hasError) {
    //     if (result.error!.code != BLOCK_SMART_OTP_CODE) {
    //       isError.value = true;
    //       errorText.value = result.error!.message;
    //       textEditingController.clear();
    //       focusNode.requestFocus();
    //     } else {
    //       isError.value = true;
    //       errorText.value = "";
    //     }
    //   }
    }
  }

  Future<void> onForgotPIN() async {
    // final isBlock = await _smartOTPRepository.smartOTPIsBlock();
    // if (!isBlock) {
    //   Get.toNamed(Routes.createSmartOtp,
    //       arguments: NavigateSmartOTPData(
    //           smartOTPType: SmartOTPType.requestToForgot,
    //           phone: userData.user?.phone ?? "",
    //           country: mainProvider.savedCountry));
    // }
  }
}
