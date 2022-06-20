import 'package:flutter/material.dart';
import 'package:trading_module/domain/entities/stock_transaction_detail.dart';
import 'package:trading_module/shared_widgets/TableView/CustomTableCell.dart';
import 'package:trading_module/shared_widgets/TableView/CustomTableHeader.dart';
import 'package:trading_module/utils/date_utils.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/extensions.dart';

class StockTransactionDetailInfo extends StatelessWidget {
  const StockTransactionDetailInfo(
    this.transaction, {
    Key? key,
  }) : super(key: key);

  final StockTransactionDetail transaction;

  @override
  Widget build(BuildContext context) {
    // final method = transaction.getMethod;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: context.disabledColor, width: 0.5),
          borderRadius: const BorderRadius.all(Radius.circular(8.0))),
      child: Column(
        children: [
          const CustomTableHeader(
            title: "Thông tin giao dịch",
          ),
          CustomTableCell(
            title: "Mã giao dịch",
            detail: transaction.transactionCode,
          ),
          CustomTableCell(
            title: "Thời gian đặt",
            detail: transaction.requestTime
                .toStringFormat(DateFormater.ddMMYYYYhhmm),
          ),
          const Divider(),
          getInForTrans(context)
        ],
      ),
    );
  }

  Widget getInForTrans(BuildContext context) {
    if (transaction.status == StockTransactionState.processed ||
        transaction.status == StockTransactionState.partiallyProcessed) {
      return Column(
        children: [
          CustomTableCell(
            title: "Mã CP",
            detail: transaction.symbol,
          ),
          CustomTableCell(
            title: "Khối lượng khớp/đặt",
            detail:
            "${transaction.quantityMatch.toStockQuantity()}/${transaction.quantity.toStockQuantity()}",
          ),
          CustomTableCell(
            title: "Giá khớp",
            detail: transaction.priceMatch.toCurrency(),
          ),
          CustomTableCell(
            title: "Số tiền thực khớp",
            detail: transaction.amountWithoutFeeVat.toCurrency(),
          ),
          CustomTableCell(
            title: "Phí mua",
            detail: transaction.feePartner.toCurrency(),
          ),
          CustomTableCell(
            title: "Phí giao dịch",
            detail: transaction.fee.toCurrency(),
          ),
          CustomTableCell(
            title: "Số tiền thực trả",
            detail: transaction.amount.toCurrency(),
            detailStyle:
            context.textSize14.copyWith(color: context.primaryColor),
          ),

        ],
      );
    } else {
      return Column(
        children: [
          CustomTableCell(
            title: "Mã CP",
            detail: transaction.symbol,
          ),
          CustomTableCell(
            title: "Khối lượng đặt",
            detail: transaction.quantity.toStockQuantity(),
          ),
          CustomTableCell(
            title: "Số tiền dự tính khớp",
            detail: transaction.amountWithoutFeeVat.toCurrency(),
          ),
          CustomTableCell(
            title: "Phí mua",
            detail: transaction.feePartner.toCurrency(),
          ),
          CustomTableCell(
            title: "Phí giao dịch",
            detail: transaction.fee.toCurrency(),
          ),
          CustomTableCell(
            title: "Số tiền dự tính trả",
            detail: transaction.amount.toCurrency(),
            detailStyle:
            context.textSize14.copyWith(color: context.primaryColor),
          ),
        ],
      );
    }
  }
}