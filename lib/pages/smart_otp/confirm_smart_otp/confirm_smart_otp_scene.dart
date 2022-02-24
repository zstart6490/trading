import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trading_project/configs/constants.dart';
import 'package:trading_project/shared_widgets/BaseScaffold.dart';
import 'package:trading_project/shared_widgets/PinCode.dart';
import 'package:trading_project/utils/extensions.dart';

import 'confirm_smart_otp_controller.dart';

class ConfirmSmartOTPScene extends GetView<ConfirmSmartOtpController> {
  const ConfirmSmartOTPScene({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<ConfirmSmartOtpController>(
      title: 'Xác nhận mã PIN Smart OTP',
      backgroundColor: Colors.white,
      body: Padding(
        padding: PAD_SYM_H16,
        child: Column(
          children: [
            SIZED_BOX_H24,
            Text(
              controller.desc,
              style: context.textSize16.copyWith(
                  fontWeight: FontWeight.w400, color: context.disabledColor),
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
                        controller.errorText,
                        style: context.textSize12
                            .copyWith(color: context.errorColor),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
