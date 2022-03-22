import 'package:flutter/material.dart';
import 'package:trading_module/domain/entities/transaction_detail.dart';
import 'package:trading_module/pages/transaction/components/withdraw_to_other_content.dart';
import 'package:trading_module/shared_widgets/TableView/CustomTableCell.dart';
import 'package:trading_module/shared_widgets/TableView/CustomTableHeader.dart';
import 'package:trading_module/utils/date_utils.dart';
import 'package:trading_module/utils/extensions.dart';


class WithdrawSavingInfo extends StatelessWidget {
  const WithdrawSavingInfo(
    this.transaction, {
    Key? key,
  }) : super(key: key);

  final TransactionDetail transaction;

  @override
  Widget build(BuildContext context) {
    // final method = transaction.getMethod;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16,horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: context.disabledColor, width: 0.5),
          borderRadius: const BorderRadius.all(Radius.circular(8.0))),
      child: Column(
        children: [
          const  CustomTableHeader(
            title: "Thông tin giao dịch",
          ),
           CustomTableCell(
              title: "Mã giao dịch",
              detail: transaction.transactionCode,
            ),
            CustomTableCell(
              title: "Thời gian",
              detail: transaction.createDate.toStringFormat(DateFormater.ddMMYYYYhhmm),
            ),
          const Divider(),
          WithdrawToOtherContent(transaction)

        ],
      ),
    );
  }
}
