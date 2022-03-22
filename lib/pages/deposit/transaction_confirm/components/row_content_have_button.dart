import 'package:flutter/material.dart';
import 'package:trading_module/theme/app_color.dart';
import 'package:trading_module/utils/util.dart';

class RowContentHaveButton extends StatelessWidget {
  final String title;
  final Function onPressChanged;
  final TextStyle? titleStyle;
  const RowContentHaveButton(
      {Key? key,
      required this.title,
      required this.onPressChanged,
      this.titleStyle})
      : super(key: key);
  void onPressed() {
    onPressChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(title,
              maxLines: 3,
              style: titleStyle ??
                  context.textSize14.copyWith(color: COLOR_NEUTRAL_300)),
        ),
        SIZED_BOX_H12,
        InkWell(
          onTap: onPressed,
          child: Text(
            "Chi tiết",
            style: context.textSize14.copyWith(color: COLOR_SEMANTIC_INFO),
          ),
        ),
      ],
    );
  }
}
