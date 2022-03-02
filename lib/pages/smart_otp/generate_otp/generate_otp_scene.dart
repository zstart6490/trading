import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/pages/smart_otp/generate_otp/generate_otp_controller.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/shared_widgets/Painter/TextBoderCountDown.dart';
import 'package:trading_module/utils/extensions.dart';


class GenerateOtpScene extends GetView<GenerateOtpController> {
  const GenerateOtpScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<GenerateOtpController>(
        backgroundColor: Colors.white,
        title: "Mã Smart OTP",
        body: Padding(
          padding: PAD_SYM_H16,
          child: Column(
            children: [
              SIZED_BOX_H24,
              Obx(
                () => RichText(
                  text: TextSpan(
                      text: "Mã xác thực Smart OTP (tự động cập nhật sau ",
                      style: context.textSize14
                          .copyWith(color: context.disabledColor),
                      children: [
                        TextSpan(
                            text: "${controller.second.value}",
                            style: context.textSize14
                                .copyWith(color: context.errorColor)),
                        const TextSpan(text: " giây)"),
                      ]),
                ),
              ),
              SIZED_BOX_H12,
              Obx(
                () => SizedBox(
                    width: double.infinity,
                    child: TextBorderCountDown(
                      time: 60,
                      child: Text(
                        controller.otp.value,
                        style: context.textSize28.copyWith(
                            fontWeight: FontWeight.w400,
                            letterSpacing: 6,
                            color: const Color(0xFF333333)),
                      ),
                    )),
              ),
              SIZED_BOX_H12,
              RichText(
                text: TextSpan(
                    text: "*",
                    style:
                        context.textSize12.copyWith(color: context.errorColor),
                    children: [
                      TextSpan(
                          text:
                              "Vui lòng không cung cấp mã OTP cho bất cứ ai trong bất cứ trường hợp nào",
                          style: context.textSize12
                              .copyWith(color: context.disabledColor)),
                    ]),
              ),
              const Spacer(),
              Obx(
                () => CustomButton.defaultStyle(
                    title: "Xác nhận",
                    onPressed: controller.canNext.value
                        ? () => controller.onConfirm()
                        : null),
              ),
              SIZED_BOX_H16,
            ],
          ),
        ));
  }
}
