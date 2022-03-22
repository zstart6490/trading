import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/domain/entities/transaction_detail.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/extensions.dart';


abstract class BaseTransactionState extends StatelessWidget {
  const BaseTransactionState(
    this.transaction, {
    Key? key,
  }) : super(key: key);

  final TransactionDetail transaction;

  String getTitle();
  String getMoneyDetail();

  @override
  Widget build(BuildContext context) {
    final color = _getColor(context);
    final fontStyle =
        context.textSize14.copyWith(color: color, fontWeight: FontWeight.w500);
    return Column(
      children: [
        SvgPicture.asset(isSuccess
            ? "assets/images/svg/ic_saving_success.svg"
            : "assets/images/svg/ic_saving_failed.svg"),
        SIZED_BOX_H16,
        Text(getTitle(), style: fontStyle),
        if (transaction.statusName.hasText)
          Text(transaction.statusName,
              textAlign: TextAlign.center,
              style: context.textSize12.copyWith(color: color)),
        if (isSuccess) Text(getMoneyDetail(), style: fontStyle),
      ],
    );
  }

  Color _getColor(BuildContext context) {
    switch (transaction.status) {
      case TransactionState.success:
        return context.primaryColor;
      default:
        return context.errorColor;
    }
  }

  String _getSubfix() {
    switch (transaction.status) {
      case TransactionState.success:
        return "thành công";
      default:
        return "không thành công";
    }
  }

  String get subfix => _getSubfix();
  String get moneyStr => "";
  bool get isSuccess => false;
}
