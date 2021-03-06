import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:tikop/modules/deposit/transfer_info/component/bank_info/frame_content_overlay.dart';
// import 'package:tikop/shared_widgets/CustomButton.dart';
// import 'package:tikop/utils/util.dart';
import 'package:trading_module/pages/deposit/transfer_info/component/bank_info/frame_content_overlay.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/utils/util.dart';


class ViewPaymentContent extends StatelessWidget {
  final Function() onContinue;
  final Function() onBack;

  final String content;
  final bool reverseView;
  const ViewPaymentContent({
    Key? key,
    required this.onContinue,
    required this.onBack,
    required this.content,
    this.reverseView = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (reverseView)
            SizedBox(
                height: 180,
                child: _ViewContent(onContinue: onContinue, onBack: onBack))
          else
            const SizedBox.shrink(),
          Column(
            children: [
              if (reverseView)
                Transform.rotate(
                  angle: pi,
                  child: SvgPicture.asset("assets/images/svg/ic_polygon.svg"),
                )
              else
                const SizedBox.shrink(),
              TransferInfoClone(content: content),
              if (!reverseView)
                SvgPicture.asset("assets/images/svg/ic_polygon.svg")
              else
                const SizedBox.shrink(),
            ],
          ),
          if (!reverseView)
            _ViewContent(onContinue: onContinue, onBack: onBack)
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _ViewContent extends StatelessWidget {
  const _ViewContent({
    Key? key,
    required this.onContinue,
    required this.onBack,
  }) : super(key: key);

  final Function() onContinue;
  final Function() onBack;

  @override
  Widget build(BuildContext context) {
    return FrameContent(
      onContinue: onContinue,
      onBack: onBack,
      title: 'Sao ch??p n???i dung chuy???n kho???n',
      detail:
          'Sao ch??p n???i dung chuy???n kho???n v?? m??? app ng??n h??ng c???a b???n ????? d??n ho???c nh???p',
      iconWidget: SvgPicture.asset("assets/images/svg/ic_copy_content.svg"),
      textContinue: '???? hi???u',
    );
  }
}

class TransferInfoClone extends StatelessWidget {
  const TransferInfoClone({Key? key, required this.content}) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: PAD_ALL16,
      width: context.screenSize.width - 64,
      decoration: const BoxDecoration(
        borderRadius: BOR_RAD8,
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "N???i dung chuy???n kho???n",
                            style: context.textSize14
                                .copyWith(color: context.disabledColor),
                            children: [
                              TextSpan(
                                  text: "*",
                                  style: context.textSize14
                                      .copyWith(color: context.errorColor))
                            ]),
                      ),
                      SIZED_BOX_H06,
                      Text(content,
                          textScaleFactor: 1, style: context.textSize14)
                    ],
                  ),
                ),
                AbsorbPointer(
                  child: SizedBox(
                    width: 96,
                    height: 35,
                    child: CustomButton(
                      title: "Sao ch??p",
                      bgColor: context.primaryColor,
                      onPressed: () {},
                      textStyle: context.textSize12
                          .copyWith(color: context.backgroundColor),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
