import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/domain/entities/stock_transaction_detail.dart';
import 'package:trading_module/utils/extensions.dart';


class StSuccessTransactionState extends StatelessWidget {
  const StSuccessTransactionState(
    this.transaction, {
    Key? key,
  }) : super(key: key);

  final StockTransactionDetail transaction;

  @override
  Widget build(BuildContext context) {
    final fontStyle =
        context.textSize14.copyWith(color: Colors.green, fontWeight: FontWeight.w500);
    return Column(
      children: [
        SvgPicture.asset("assets/images/svg/ic_saving_success.svg"),
        SIZED_BOX_H16,
        Text("Lệnh mua thành công", style: fontStyle),
        Text("${transaction.quantity.toString()} CP", style: fontStyle),
      ],
    );
  }

}
