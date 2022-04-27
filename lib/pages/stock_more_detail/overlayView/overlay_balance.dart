import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trading_module/pages/stock_more_detail/stock_more_detail_scene.dart';
import 'package:trading_module/theme/app_color.dart';

import 'package:trading_module/utils/util.dart';

class OverlayBalance extends StatelessWidget {
  const OverlayBalance({
    Key? key,
    required this.totalAmountOffset,
    this.reverseViewPaymentContent = false,
    this.reverseViewAccountNumber = false,
  }) : super(key: key);

  final Offset totalAmountOffset;
  final bool reverseViewPaymentContent;
  final bool reverseViewAccountNumber;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: totalAmountOffset.dy - 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SIZED_BOX_H20,
              Row(
                children: [
                  SizedBox(width: Get.width - 60),

                  Container(
                    decoration: const BoxDecoration(
                        color: COLOR_WHITE, shape: BoxShape.circle),
                    child: const AbsorbPointer(
                      child: FollowStockComponent(),
                    ),
                  ),

                ],
              ),
              SIZED_BOX_H08,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: Get.width - 46),
                  SvgPicture.asset("assets/images/svg/ic_polygon.svg",
                      package: "trading_module"),
                ],
              ),
              Padding(
                padding: PAD_SYM_H12,
                child: Container(
                  width: Get.width - 24,
                  decoration: const BoxDecoration(
                    color: COLOR_WHITE,
                    borderRadius: BOR_RAD8,
                  ),
                  child: AbsorbPointer(
                    child: Padding(
                      padding: PAD_SYM_H12_V16,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Theo dõi chứng khoán',
                                  style: context.textSize14.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Click vào icon để thêm CP này vào danh sách Đang theo dõi',
                                  style: context.textSize12.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: COLOR_NEUTRAL_300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 48,
                            width: 48,
                            child: "ic_follow_stock".pngImage(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
