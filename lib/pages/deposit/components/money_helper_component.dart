import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trading_module/utils/util.dart';


class MoneyHelperComponent extends StatelessWidget {
  const MoneyHelperComponent({
    Key? key,
    this.onTappedMoney,
    required this.amount,
    required this.minAmount,
    required this.maxAmount,
  }) : super(key: key);

  final int amount;
  final int minAmount;
  final int maxAmount;
  final Function(int)? onTappedMoney;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      height: 50,
      child: ListView.separated(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (c, index) => const VerticalDivider(
          endIndent: 8,
          indent: 8,
          color: Colors.black26,
          width: 1,
        ),
        itemBuilder: (context, index) {
          if (amount < minAmount) {
            var m = 0;
            switch (index) {
              case 0:
                m = 50000;
                break;
              case 1:
                m = 100000;
                break;
              case 2:
                m = 300000;
                break;
            }
            return _MoneyHelper(
              amount: m,
              onTapped: () => onTappedMoney?.call(m),
            );
          } else {
            final m = amount * pow(10, index).toInt();
            if (m > maxAmount) return const SizedBox();
            return _MoneyHelper(
              amount: m,
              onTapped: () => onTappedMoney?.call(m),
            );
          }
        },
      ),
    );
  }
}

class _MoneyHelper extends StatelessWidget {
  const _MoneyHelper({Key? key, required this.amount, this.onTapped})
      : super(key: key);
  final int amount;
  final VoidCallback? onTapped;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTapped?.call(),
      child: SizedBox(
        width: context.screenSize.width / 3 - 2,
        child: Padding(
          padding: PAD_SYM_H4,
          child: Center(
            child: Text(
              amount.toCurrency(symbol: ""),
              style: context.textSize16.copyWith(fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }
}
