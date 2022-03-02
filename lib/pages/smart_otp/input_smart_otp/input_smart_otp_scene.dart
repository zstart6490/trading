import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/pages/smart_otp/input_smart_otp/input_smart_otp_controller.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/PinCode.dart';
import 'package:trading_module/utils/extensions.dart';

class InputSmartOTPScene extends GetView<InputSmartOTPController> {
  const InputSmartOTPScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<InputSmartOTPController>(
      title: "Nhập mã PIN Smart OTP",
      backgroundColor: Colors.white,
      body: Padding(
        padding: PAD_SYM_H16,
        child: Column(
          children: [
            SIZED_BOX_H24,
            SizedBox(
              width: double.infinity,
              child: Text(
                  "Vui lòng nhập mã PIN gồm 4 ký tự bạn đã cài đặt từ trước",
                  style: context.textSize16.copyWith(
                      fontWeight: FontWeight.w400,
                      color: context.disabledColor)),
            ),
            SIZED_BOX_H60,
            Obx(
              () => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: SizedBox(
                        width: 120,
                        child: PinCode(
                          activeColor: controller.isError.value
                              ? context.errorColor
                              : context.primaryColor,
                          focusNode: controller.focusNode,
                          textEditingController:
                              controller.textEditingController,
                          onChanged: (pin) => controller.onChanged(pin),
                        )),
                  ),
                  if (controller.isError.value)
                    Center(
                      child: Text(
                        controller.errorText.value,
                        textAlign: TextAlign.center,
                        style: context.textSize12
                            .copyWith(color: context.errorColor),
                      ),
                    )
                ],
              ),
            ),
            const Spacer(),
            RichText(
                text: TextSpan(
                    text: "*",
                    style: context.textSize14.copyWith(color: Colors.red),
                    children: [
                  TextSpan(
                      text:
                          "Lưu ý: Đây là mã PIN bạn đã cài đặt, không phải mã OTP qua tin nhắn",
                      style: context.textSize14
                          .copyWith(color: context.disabledColor)),
                ])),
            TextButton(
                onPressed: () => controller.onForgotPIN(),
                child: const Text("Quên mã PIN?")),
            SIZED_BOX_H16,
          ],
        ),
      ),
    );
  }
}
