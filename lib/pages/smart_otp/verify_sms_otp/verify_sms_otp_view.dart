import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/shared_widgets/CustomTextField.dart';
import 'package:trading_module/shared_widgets/ResendOTP.dart';
import 'package:trading_module/theme/app_color.dart';
import 'package:trading_module/utils/extensions.dart';
import 'package:trading_module/utils/text_field_utils/otp_formatter.dart';


import 'verify_sms_otp_controller.dart';

class VerifySMSOTPView extends GetView<VerifySMSOTPController> {
  const VerifySMSOTPView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<VerifySMSOTPController>(
      title: 'Nhập OTP',
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(16, 30, 16, 25),
                  child: Obx(() => RichText(
                        text: TextSpan(
                            text: controller.desc.value,
                            style: const TextStyle(
                                color: Color(0xFF858585),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                            children: [
                              TextSpan(
                                  text: controller.descSecond.value,
                                  style: context.textSize16
                                      .copyWith(color: const Color(0xFF333333)))
                            ]),
                      ))),
              Padding(
                padding: PAD_SYM_H16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mã OTP',
                      style: context.textSize12.copyWith(
                          color: COLOR_NEUTRAL_500,
                          fontWeight: FontWeight.w400),
                    ),
                    SIZED_BOX_H08,
                    Form(
                      key: controller.formKey,
                      child: Obx(
                        () => TextFieldCustomBorder(
                          autoFocus: controller.focusState.value,
                          hintText: "Nhập mã OTP",
                          controller: controller.textController,
                          textInputType: TextInputType.number,
                          formaters: [
                            FilteringTextInputFormatter.digitsOnly,
                            OTPInputFormatter(),
                          ],
                          textStyle: context.textSize16.copyWith(
                              color: controller.errors.value.code != -1
                                  ? context.errorColor
                                  : Colors.black),
                          onChanged: (val) => controller.onChangeOTP(val),
                          errors: controller.errors.value,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
          Padding(
            padding: PAD_ALL16,
            child: Column(
              children: [
                Obx(() => ResentOTP(
                      textStyle: context.textSize14
                          .copyWith(color: context.primaryColor),
                      duration: controller.otpExpired.value,
                      onPressed: () => controller.reSendOTP(),
                    )),
                SIZED_BOX_H16,
                Obx(
                  () => CustomButton.trailingStyle(
                    title: "Xác nhận",
                    textStyle: context.textSize18light,
                    trailing: const Icon(
                      null,
                    ),
                    onPressed:
                        controller.otp.value.removeAllWhitespace.length == 6
                            ? () => onNext()
                            : null,
                  ),
                ),
                SIZED_BOX_H16,
              ],
            ),
          )
        ],
      ),
    );
  }

  void onNext() {
    if (controller.formKey.currentState?.validate() ?? false) {
      final otp = controller.textController.text.removeAllWhitespace;
      controller.verifyOTP(otp);
    }
  }
}
