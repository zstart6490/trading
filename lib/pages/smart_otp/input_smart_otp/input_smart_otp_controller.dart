import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/domain/use_cases/otp_use_case.dart';
import 'package:trading_module/routes/app_pages.dart';

class InputSmartOTPController extends BaseController {
  RxBool isError = false.obs;
  final SmartOTPType type;
  late FocusNode focusNode;
  late TextEditingController textEditingController;
  RxString errorText = "".obs;

  // final SmartOTPRepository _smartOTPRepository = SmartOTPRepository();

  InputSmartOTPController(this.type);

  final OtpUseCase _otpUseCase = Get.find();

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
      String token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJiaXJ0aGRheSI6IjIwMjIvMDIvMjMiLCJwaG9uZU51bWJlciI6IjA5NzM1OTE3MjgiLCJhZGRyZXNzIjoiVGF5IEhhIFRvd2VyLCAxOCBUbyBIdXUsIE5hbSBUdSBMaWVtLCBIYSBOb2ksIFZpZXQgTmFtZSIsImdlbmRlciI6IjAiLCJuYW1lIjoiMDk3MzU5MTcyOCIsImlkIjoxMjEsImV4cCI6MTY0NjI5NjcyNCwidXVpZCI6ImM3M2ViMDllLTQ2Y2ItNDUxNC05YmExLTljOGZhMTJmMjVkOSIsImVtYWlsIjoidHJhZGluZ0B0ZWNobGFiLmFpIn0.50HWCUU-GYlj-UUUJ7No0dy8HH_6ftP1ibJhvLfVptN15rbCNkqJEnKasPXgLGCKtCcRXyKSk0rnr2xHCJ5-eeO3UbU5LXJZuqmrrL2R0O6Xm6NCSc2NFeiNR94cTU3VjKOpBHxXuyL8vqe3Fst8aknvGY8qsJNcuGZ450khwGl9xHtlpaVyPafssvXU6ClaJSQP9OoGlT9PZJ_f2eJ4meUT27UU289t9n48t117od_fBGdiJ-1vdOIFCoOhL2E4BB8H8OPsY8lnkGZDvxNT6rPBRC0DAiMGhwu4o6G5scJfNDeETjssZ4-_CtqyzaHlD4cFTQeHTwm72idqYPvx4DOxQ-IEhlNFhpKcW-Qzh7fLLnl5beIU5JVBM7-Llb2GRaTqbKQiFqrFT45YEQnefTFzI5fkogc3RTVZtMIrVij7AahJ18RD_XSiHxD-LrZizveXVFmGibqlcmyqferVYgBGKFaAGlCLTuzka2Mh6Yx9uXfMU7YIo4I_WrZ-4b3FXo9TSfJV4E_SKXDcMkrBXDFghBovmPAJGHthRN1eDEI0XI49psW_8Dx_1AxAXXCxg8rNL0mLU8CM_R7i7Fz_C-Mnz-nXZheT_93G5ZOtBuXcnQv0L2vzq2k0WECMONtUd1emvefWAE9MF1RCJy9KQvWrMpPe7q_Wh8eaO_hig_w";
      final result = _otpUseCase.checkPin("1234", token);
      //Get.toNamed(Routes.SMART_OPT_GENERATE);
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
