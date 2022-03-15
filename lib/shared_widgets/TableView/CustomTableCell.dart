import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/states/base_common_widget.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/extensions.dart';


/// Title ngắn hơn nội dung
class CustomTableCell extends StatelessWidget with BaseCommonWidgets {
  final String title;
  final TextStyle? titleStyle;
  final String detail;
  final TextStyle? detailStyle;
  final bool canCopy;
  const CustomTableCell({
    Key? key,
    required this.title,
    this.titleStyle,
    required this.detail,
    this.detailStyle,
    this.canCopy = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            title,
            maxLines: 1,
            minFontSize: 14,
            overflow: TextOverflow.ellipsis,
            style: titleStyle ??
                context.textSize14.copyWith(color: context.disabledColor),
          ),
          SIZED_BOX_W12,
          Expanded(
            child: Text(
              detail,
              style: detailStyle ?? context.textSize14,
              maxLines: 2,
              textAlign: TextAlign.right,
            ),
          ),
          if (canCopy)
            InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: detail));
                showSnackBar("Đã sao chép ${title.toLowerCase()}",
                    type: SnackBarType.success);
              },
              child: Padding(
                padding: PAD_SYM_H4,
                child: SvgPicture.asset("assets/images/svg/ic_copy.svg"),
              ),
            )
        ],
      ),
    );
  }
}

/// Title dài hơn nội dung
class CustomTableCell2 extends StatelessWidget with BaseCommonWidgets {
  final String title;
  final String detail;
  final TextStyle? detailStyle;
  final bool canCopy;
  const CustomTableCell2({
    Key? key,
    required this.title,
    required this.detail,
    this.detailStyle,
    this.canCopy = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: context.textSize14.copyWith(color: context.disabledColor),
              maxLines: 2,
            ),
          ),
          SIZED_BOX_W12,
          AutoSizeText(
            detail,
            style: detailStyle ?? context.textSize14,
            maxLines: 1,
            minFontSize: 14,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
          ),
          if (canCopy)
            InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: detail));
                showSnackBar("Đã sao chép ${title.toLowerCase()}",
                    type: SnackBarType.success);
              },
              child: Padding(
                padding: PAD_SYM_H4,
                child: SvgPicture.asset("assets/images/svg/ic_copy.svg"),
              ),
            )
        ],
      ),
    );
  }
}

class CustomTableCellWithLink extends StatelessWidget with BaseCommonWidgets {
  final String title;
  final String detail;
  final String link;
  final TextStyle? detailStyle;
  final Function() onTappedLink;

  const CustomTableCellWithLink({
    Key? key,
    required this.title,
    required this.detail,
    required this.link,
    this.detailStyle,
    required this.onTappedLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: RichText(
                text: TextSpan(
                    text: title,
                    style: context.textSize14
                        .copyWith(color: context.disabledColor),
                    children: [
                  const TextSpan(text: "("),
                  TextSpan(
                      text: link,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => onTappedLink.call(),
                      style: context.textSize14.copyWith(
                          decoration: TextDecoration.underline,
                          color: Colors.blue)),
                  const TextSpan(text: ")")
                ])),
          ),
          SIZED_BOX_W12,
          AutoSizeText(
            detail,
            style: detailStyle ?? context.textSize14,
            maxLines: 1,
            minFontSize: 14,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
