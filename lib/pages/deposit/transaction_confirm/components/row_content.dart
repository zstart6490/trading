import 'package:flutter/material.dart';
import 'package:trading_module/theme/app_color.dart';
import 'package:trading_module/utils/util.dart';

class RowContent extends StatelessWidget {
  final String title;
  final String value;
  final bool isMoney;
  const RowContent(
      {Key? key, required this.title, required this.value, this.isMoney = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: context.textSize14.copyWith(color: COLOR_NEUTRAL_500)),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: context.textSize14.copyWith(
                color: isMoney ? PRIMARY_COLOR_L : COLOR_NEUTRAL_500,
                fontWeight: isMoney ? FontWeight.w500 : FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
