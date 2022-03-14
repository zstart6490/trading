import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tikop/modules/deposit/transfer_type/component/intro_9pay.dart';
import 'package:tikop/shared_widgets/CustomShadow.dart';
import 'package:tikop/theme/app_color.dart';
import 'package:tikop/utils/util.dart';

class NinePayType extends StatelessWidget {
  final String title;
  final String info;
  final String cost;
  final VoidCallback? onTapped;
  const NinePayType(
      {Key? key,
      required this.title,
      required this.info,
      required this.cost,
      this.onTapped})
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
                    Image.asset("assets/images/png/ic_9pay.png"),
                    Expanded(
                      child: Padding(
                        padding: PAD_SYM_H12,
                        child: AutoSizeText(
                          title,
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
                SIZED_BOX_H16,
                const Intro9PayComponent(),
                SIZED_BOX_H06,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    // const info =
    //     "*Dùng app ngân hàng của bạn để chuyển khoản đến tài khoản ngân hàng của 9Pay (đối tác thanh toán của Tikop)";
    final List<TextSpan> childrens = [];

    childrens.add(TextSpan(
      text: "*",
      style: context.textSize12.copyWith(color: Colors.red),
    ));
    final infos = info.split("9Pay");
    for (int i = 0; i < infos.length; i++) {
      childrens.add(TextSpan(
        text: infos[i],
        style: context.textSize12.copyWith(color: context.disabledColor),
      ));
      if (i != infos.length - 1) {
        childrens.add(TextSpan(
          text: "9Pay",
          style: context.textSize12.copyWith(color: Colors.blue),
        ));
      }
    }

    return RichText(text: TextSpan(children: childrens));
  }
}
