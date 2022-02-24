import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_project/configs/constants.dart';
import 'package:trading_project/shared_widgets/BaseScaffold.dart';
import 'package:trading_project/shared_widgets/PinCode.dart';
import 'package:trading_project/utils/extensions.dart';


import 'create_smart_otp_controller.dart';

class CreateSmartOTPScene extends GetView<CreateSmartOTPController> {
  const CreateSmartOTPScene({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<CreateSmartOTPController>(
      title: "Nhập mã PIN Smart OTP mới",
      backgroundColor: Colors.white,
      body: Padding(
        padding: PAD_SYM_H16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SIZED_BOX_H24,
            Text(
                "Xin vui lòng nhập 4 số để cài đặt lại mã PIN mới cho Smart OTP (ví dụ: 1234)",
                style: context.textSize16.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF858585))),
            SIZED_BOX_H60,
            Center(
              child: SizedBox(
                  width: 120,
                  child: PinCode(
                    activeColor: context.primaryColor,
                    focusNode: controller.focusNode,
                    textEditingController: controller.textEditingController,
                    onChanged: (pin) => controller.onChange(pin),
                  )),
            ),
            const Spacer(),
            RichText(
                text: TextSpan(
                    text: "*",
                    style: context.textSize14.copyWith(color: Colors.red),
                    children: [
                  TextSpan(
                      text:
                          "Lưu ý: Mã PIN sẽ sử dụng để thay thế cho OTP qua tin nhắn trong các giao dịch rút tiền của Tikop",
                      style: context.textSize14
                          .copyWith(color: context.disabledColor)),
                ])),
            SIZED_BOX_H16,
          ],
        ),
      ),
    );
  }
}
