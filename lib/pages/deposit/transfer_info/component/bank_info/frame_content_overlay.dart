import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tikop/theme/app_color.dart';
import 'package:tikop/utils/util.dart';

class FrameContent extends StatelessWidget {
  const FrameContent({
    Key? key,
    required this.onContinue,
    this.onBack,
    this.title = '',
    this.detail = '',
    this.iconWidget,
    this.textContinue,
    this.textBack,
  }) : super(key: key);

  final Function() onContinue;
  final Function()? onBack;

  final String title;
  final String detail;
  final Widget? iconWidget;
  final String? textContinue;
  final String? textBack;
  @override
  Widget build(BuildContext context) {
    final double width = Get.width;
    return Column(
      children: [
        Container(
          padding: PAD_ALL12,
          width: width - 32,
          decoration: const BoxDecoration(
              color: COLOR_WHITE,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        textScaleFactor: 1,
                        style: context.textSize14.copyWith(
                            color: COLOR_NEUTRAL_500,
                            fontWeight: FontWeight.w500),
                      ),
                      SIZED_BOX_H04,
                      Text(
                        detail,
                        textScaleFactor: 1,
                        style: context.textSize14.copyWith(
                          color: COLOR_NEUTRAL_300,
                        ),
                      ),
                    ],
                  )),
                  SIZED_BOX_W40,
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: iconWidget ??
                        SvgPicture.asset("assets/images/svg/ic_atm.svg"),
                  ),
                ],
              ),
              SIZED_BOX_H08,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (onBack != null)
                    GestureDetector(
                      onTap: onBack,
                      child: Text(
                        textBack ?? 'Quay lại',
                        textScaleFactor: 1,
                        style: context.textSize12.copyWith(
                            color: COLOR_NEUTRAL_200,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  else
                    const SizedBox.shrink(),
                  SIZED_BOX_W16,
                  GestureDetector(
                    onTap: onContinue,
                    child: Row(
                      children: [
                        Text(
                          textContinue ?? 'Tiếp tục',
                          textScaleFactor: 1,
                          style: context.textSize12.copyWith(
                              color: COLOR_SEMANTIC_INFO,
                              fontWeight: FontWeight.w500),
                        ),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: COLOR_SEMANTIC_INFO,
                          size: 12,
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
