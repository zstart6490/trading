import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:tikop/models/SavingProduct.dart';
// import 'package:tikop/shared_widgets/CustomShadow.dart';
// import 'package:tikop/theme/app_color.dart';
// import 'package:tikop/utils/util.dart';

import 'package:trading_module/data/entities/naptien/SavingProduct.dart';
import 'package:trading_module/shared_widgets/CustomShadow.dart';
import 'package:trading_module/theme/app_color.dart';
import 'package:trading_module/utils/util.dart';

class SavingProductType extends StatelessWidget {
  final SavingProduct product;
  final String cost;
  final String info;
  final VoidCallback? onTapped;
  const SavingProductType(
      {Key? key,
      required this.product,
      this.onTapped,
      required this.cost,
      required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PAD_ALL16,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => onTapped?.call(),
        child: CustomShadow(
          child: Padding(
            padding: PAD_ALL12,
            child: Column(
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: product.icon ?? "",
                        width: 48.0,
                        height: 48.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: PAD_SYM_H12,
                        child: AutoSizeText(
                          product.fullName ?? "",
                          maxLines: 2,
                          style: context.textSize16.copyWith(
                              fontWeight: FontWeight.w500,
                              color: COLOR_NEUTRAL_500),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: context.primaryColor,
                      size: 36,
                    ),
                  ],
                ),
                SIZED_BOX_H16,
                Column(
                  children: [
                    _buildInfo(context),
                    SIZED_BOX_H06,
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/svg/ic_tag.svg"),
                        SIZED_BOX_W06,
                        Text(
                          "Phí dịch vụ ",
                          style: context.textSize12
                              .copyWith(color: context.disabledColor),
                        ),
                        AutoSizeText(
                          cost,
                          style: context.textSize12
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    final List<TextSpan> childrens = [];

    childrens.add(TextSpan(
      text: "*",
      style: context.textSize12.copyWith(color: Colors.red),
    ));

    final infos = info.replaceAll(RegExp('@name'), product.fullName ?? "");

    childrens.add(TextSpan(
      text: infos,
      style: context.textSize12.copyWith(color: context.disabledColor),
    ));

    return RichText(text: TextSpan(children: childrens));
  }
}
