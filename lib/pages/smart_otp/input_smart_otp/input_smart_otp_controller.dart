import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/domain/use_cases/otp_use_case.dart';


class InputSmartOTPController extends BaseController {
  RxBool isError = false.obs;
  final SmartOTPType type;
  late FocusNode focusNode;
  late TextEditingController textEditingController;
  RxString errorText = "".obs;


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
      showProgressingDialog();
      final result = await _otpUseCase.checkPin(pin, mainProvider.dataInputApp.token);
      hideDialog();
        if (result.data != null) {
          isError.value = false;
          errorText.value = "";
          Get.toNamed(AppRoutes.SMART_OPT_GENERATE);
        } else if (result.error != null) {
          if (result.error!.code != BLOCK_SMART_OTP_CODE) {
            isError.value = true;
            errorText.value = result.error!.message;
            textEditingController.clear();
            focusNode.requestFocus();
          } else {
            isError.value = true;
            errorText.value = "";
            _showDialogNotify(result.error!.message);
          }
        }
    }
  }

  void _showDialogNotify(String desc) {
    final dialog = CustomAlertDialog(
      title: "Tính năng tạm khoá".tr,
      desc: desc,
      actions: [
        AlertAction.ok(() {
          hideDialog();
        })
      ],
    );
    showMessageDialog(dialog, name: "BlockMiniGame", canDissmiss: false);
  }

  Future<void> onForgotPIN() async {
    //Get.toNamed(AppRoutes.SMART_OPT_GENERATE);
    final result = await _otpUseCase.smartOTPIsBlock(mainProvider.dataInputApp.token);
    if (result.data?.isBlock == false) {
      //Get.toNamed(AppRoutes.SMART_OPT_GENERATE);
      // Get.toNamed(Routes.createSmartOtp,
      //     arguments: NavigateSmartOTPData(
      //         smartOTPType: SmartOTPType.requestToForgot,
      //         phone: userData.user?.phone ?? "",
      //         country: mainProvider.savedCountry));
    }else if (result.error != null) {
      _showDialogNotify(result.error!.message);
    }else{
      Get.toNamed(AppRoutes.SMART_OPT_GENERATE);
    }
  }
}
