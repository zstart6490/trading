import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trading_module/utils/extensions.dart';

class ResentOTP extends StatelessWidget {
  final VoidCallback onPressed;
  final TextStyle textStyle;
  final int duration;
  const ResentOTP({
    Key? key,
    required this.onPressed,
    required this.textStyle,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (duration > 0) {
      return RichText(
        maxLines: 1,
        text: TextSpan(
          text: "Gửi lại OTP ",
          style: textStyle.copyWith(color: context.disabledColor),
          children: <TextSpan>[
            TextSpan(
                text: "($duration)",
                style: textStyle.copyWith(color: context.errorColor)),
          ],
        ),
      );
    } else {
      return InkWell(
          onTap: () => onPressed.call(),
          child: Text("Gửi lại OTP",
              style: textStyle.copyWith(color: context.primaryColor)));
    }
  }
}

class ResentOTP2 extends StatelessWidget {
  final VoidCallback? onResend;
  final TextStyle? textStyle;
  final int duration;
  final String content;
  final int? maxLines;
  const ResentOTP2({
    Key? key,
    this.onResend,
    this.textStyle,
    required this.duration,
    required this.content,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = textStyle ?? context.textSize14;

    if (duration > 0) {
      return RichText(
        maxLines: maxLines,
        text: TextSpan(
          text: content,
          style: style.copyWith(color: context.disabledColor),
          children: <TextSpan>[
            TextSpan(
                text: "($duration)",
                style: style.copyWith(color: context.errorColor)),
            const TextSpan(
              text: " giây.",
            ),
          ],
        ),
      );
    } else {
      return RichText(
        maxLines: maxLines,
        text: TextSpan(
          text: content,
          style: style.copyWith(color: context.disabledColor),
          children: <TextSpan>[
            TextSpan(
                text: "(0)", style: style.copyWith(color: context.errorColor)),
            const TextSpan(
              text: " giây.",
            ),
            TextSpan(
              text: " Gửi lại OTP",
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  log("onResend");
                  onResend?.call();
                },
              style: style.copyWith(color: Colors.blue),
            ),
          ],
        ),
      );
    }
  }
}
