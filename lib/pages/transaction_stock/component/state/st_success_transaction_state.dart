import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/domain/entities/stock_transaction_detail.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/extensions.dart';


class StSuccessTransactionState extends StatelessWidget {
  final StockTransactionDetail transaction;
  final StockTransactionType stockTransactionType;

  const StSuccessTransactionState({
    Key? key,
    required this.transaction,
    required this.stockTransactionType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontStyle =
        context.textSize14.copyWith(color: Colors.green, fontWeight: FontWeight.w500);
    return Column(
      children: [
        SIZED_BOX_H26,
        SvgPicture.asset("assets/images/svg/ic_saving_success.svg"),
        SIZED_BOX_H16,
        Text("Lệnh ${stockTransactionType==StockTransactionType.buy?"mua":"bán"} thành công", style: fontStyle),
        Text("${transaction.quantity.toString()} CP", style: fontStyle),
      ],
    );
  }

}
