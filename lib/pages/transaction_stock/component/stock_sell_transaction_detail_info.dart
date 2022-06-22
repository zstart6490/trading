import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tooltip/simple_tooltip.dart';
import 'package:trading_module/domain/entities/stock_transaction_detail.dart';
import 'package:trading_module/pages/transaction_stock/transaction_stock_controller.dart';
import 'package:trading_module/shared_widgets/TableView/CustomTableCell.dart';
import 'package:trading_module/shared_widgets/TableView/CustomTableHeader.dart';
import 'package:trading_module/utils/date_utils.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/extensions.dart';

class StockSellTransactionDetailInfo extends StatelessWidget {
  const StockSellTransactionDetailInfo(
    this.transaction, {
    Key? key,
  }) : super(key: key);

  final StockTransactionDetail transaction;

  @override
  Widget build(BuildContext context) {
    // final method = transaction.getMethod;
    final TransactionStockController _transactionStockController =
        Get.find<TransactionStockController>();
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
    final TransactionStockController _transactionStockController =
        Get.find<TransactionStockController>();
    if (transaction.status == StockTransactionState.processed ||
        transaction.status == StockTransactionState.partiallyProcessed) {
      return Column(children: [
        CustomTableCell(
          title: "Mã CP",
          detail: transaction.symbol,
        ),
        CustomTableCell(
          title: "Khối lượng khớp/đặt",
          detail:
          "${transaction.quantityMatch.toStockQuantity()}/${transaction.quantity.toStockQuantity()}",
        ), CustomTableCell(
          title: "Giá khớp",
          detail:transaction.priceMatch.toCurrency(),
        ),
        CustomTableCell(
          title: "Số tiền dự tính khớp",
          detail: transaction.amountWithoutFeeVat.toCurrency(),
        ),
        CustomTableCell(
          title: "Phí bán",
          detail: transaction.feePartnerMatch.toCurrency(),
          icon: feeTransactionDescription(context, _transactionStockController),
        ),
        CustomTableCell(
          title: "Phí giao dịch",
          detail: transaction.feeMatch.toCurrency(),
        ),
        CustomTableCell(
          title: "Số tiền dự tính nhận",
          detail: transaction.amount.toCurrency(),
          detailStyle: context.textSize14.copyWith(
              color: context.primaryColor, fontWeight: FontWeight.bold),
        ),
      ]);
    } else {
      return Column(children: [
        CustomTableCell(
          title: "Mã CP",
          detail: transaction.symbol,
        ),
        CustomTableCell(
          title: "Khối lượng đặt",
          detail: transaction.quantity.toStockQuantity(),
        ),
        CustomTableCell(
          title: "Giá đặt",
          detail: transaction.price.toCurrency(),
        ),
        CustomTableCell(
          title: "Số tiền dự tính khớp",
          detail: transaction.amountWithoutFeeVat.toCurrency(),
        ),
        CustomTableCell(
          title: "Phí bán",
          detail: transaction.feePartner.toCurrency(),
          icon: feeTransactionDescription(context, _transactionStockController),
        ),
        CustomTableCell(
          title: "Phí giao dịch",
          detail: transaction.fee.toCurrency(),
        ),
        CustomTableCell(
          title: "Số tiền dự tính nhận",
          detail: transaction.amount.toCurrency(),
          detailStyle: context.textSize14.copyWith(
              color: context.primaryColor, fontWeight: FontWeight.bold),
        ),
      ]);
    }
  }

  Widget feeTransactionDescription(BuildContext context,
      TransactionStockController _transactionStockController) {
    return InkWell(
      onTap: () => _transactionStockController.showToolTip(),
      child: Obx(
        () => SimpleTooltip(
            arrowBaseWidth: 18,
            //minWidth: MediaQuery.of(context).size.width - 150,
            arrowLength: 11,
            ballonPadding:
                const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
            borderRadius: 2,
            borderWidth: 1,
            borderColor: const Color(0xFF606060),
            backgroundColor: const Color(0xFF333333),
            minimumOutSidePadding: 12.0,
            animationDuration: const Duration(milliseconds: 190),
            show: _transactionStockController.isShowToolTip.value,
            hideOnTooltipTap: true,
            tooltipDirection: TooltipDirection.down,
            arrowTipDistance: 4,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Tiền phí bán được chi trả cho bên CTCK bao gồm:",
                  style: context.textSize12.copyWith(color: Colors.white),
                ),
                Text(
                  "+ Phí giao dịch với CTCK",
                  style: context.textSize12.copyWith(color: Colors.white),
                ),
                Text(
                  "+ Phí giao dịch với sở",
                  style: context.textSize12.copyWith(color: Colors.white),
                ),
                Text(
                  "+ Thuế bán",
                  style: context.textSize12.copyWith(color: Colors.white),
                ),
                Text(
                  "+ Phí chuyển khoán chứng khoán",
                  style: context.textSize12.copyWith(color: Colors.white),
                ),
              ],
            ),
            child: const Icon(
              Icons.info,
              color: Color(0xFF9AA0A5),
              size: 18,
            )),
      ),
    );
  }
}
