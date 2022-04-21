import 'package:flutter/material.dart';
import 'package:trading_module/utils/extensions.dart';

class CellHeaderFinanceInfo extends StatelessWidget {
  final String title;
  final String contentRow1;
  final String contentRow2;

  const CellHeaderFinanceInfo(
      {Key? key,
      required this.title,
      required this.contentRow1,
      required this.contentRow2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: const BoxDecoration(color: Color(0xFFF5F6FA)),
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: context.textSize14.copyWith(
                  color: const Color(0xFF00B14F),
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const BoxDecoration(color: Color(0xFFF0F0F0)),
                  child: Text(
                    contentRow1,
                    textAlign: TextAlign.end,
                    style: context.textSize14.copyWith(fontWeight: FontWeight.w700),
                  ))),
          Expanded(
              flex: 2,
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                  decoration: const BoxDecoration(color: Color(0xFFF0F0F0)),
                  child: Text(
                    contentRow2,
                    textAlign: TextAlign.end,
                    style: context.textSize14.copyWith(color: Colors.black,fontWeight: FontWeight.w700),
                  )))
        ],
      ),
    );
  }
}
