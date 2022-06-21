import 'package:flutter/material.dart';
import 'package:trading_module/domain/entities/transaction_detail.dart';
import 'package:trading_module/shared_widgets/TableView/CustomTableCell.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/extensions.dart';

class WithdrawToOtherContent extends StatelessWidget {
  const WithdrawToOtherContent(
    this.transaction, {
    Key? key,
  }) : super(key: key);

  final TransactionDetail transaction;

  @override
  Widget build(BuildContext context) {
    final methodStr = transaction.getMethodDisplay;

    return Column(
      children: [
        if (methodStr != null &&
            transaction.getState != TransactionState.failed)
          CustomTableCell(
            title: "Hình thức",
            detail: methodStr,
          ),
        if (transaction.bankName.hasText)
           CustomTableCell(
            title: "Ngân hàng",
            detail: transaction.bankName,
          ),
         CustomTableCell(
          title: "Số tài khoản",
          detail: transaction.accountNo,
        ),
         CustomTableCell(
          title: "Chủ tài khoản",
          detail: transaction.accountName,
        ),
        CustomTableCell(
          title: "Nguồn tiền",
          detail: transaction.fundsLabel,
          detailStyle: context.textSize14.copyWith(color: context.primaryColor,fontWeight: FontWeight.bold),
        ),
         CustomTableCell(
          title: "Số tiền rút",
          detail: transaction.requestAmount.toCurrency(),
        ),
        CustomTableCell(
          title: "Phí giao dịch",
          detail: transaction.fee.toCurrency(),
        ),
        CustomTableCell(
          title: "Tiền thực nhận",
          detail: transaction.receiveAmount.toCurrency(),
          detailStyle: context.textSize14.copyWith(color: context.primaryColor,fontWeight: FontWeight.bold),
        ),

      ],
    );
  }
}
