import 'package:flutter/material.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/utils/extensions.dart';

class CellFinanceInfo extends StatelessWidget {
  final String title;
  final String contentRow1;
  final String contentRow2;
  final FontWeight? fontWeight;
  final Color? textColor;

  const CellFinanceInfo(
      {Key? key,
      required this.title,
      required this.contentRow1,
      required this.contentRow2,
      this.fontWeight = FontWeight.normal,
      this.textColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: context.textSize14
                      .copyWith(color: textColor, fontWeight: fontWeight),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Text(
                    contentRow1,
                    textAlign: TextAlign.end,
                    style: context.textSize14
                        .copyWith(color: textColor, fontWeight: fontWeight),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    contentRow2,
                    textAlign: TextAlign.end,
                    style: context.textSize14
                        .copyWith(color: textColor, fontWeight: fontWeight),
                  ))
            ],
          ),
          SIZED_BOX_H12,
          const Divider(
            color: Color(0xFFF0F0F0),
            height: 3,
          )
        ]));
  }
}
