import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/data/entities/navigate_stock_trans_detail.dart';
import 'package:trading_module/pages/transaction_stock/component/st_transaction_state_component.dart';
import 'package:trading_module/pages/transaction_stock/component/stock_buy_transaction_detail_info.dart';
import 'package:trading_module/pages/transaction_stock/component/stock_sell_transaction_detail_info.dart';
import 'package:trading_module/pages/transaction_stock/transaction_stock_controller.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/utils/enums.dart';

class TransactionStockDetailScene extends GetView<TransactionStockController> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<TransactionStockController>(
      title: "Chi tiết lệnh",
      elevation: 0,
      backgroundColor: Colors.white,
      body: Column(children: [
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              StockTransactionStateComponent(
                  controller.navigateStockTranDetail),
              switchInfoType(controller.navigateStockTranDetail),
            ],
          ),
        )),
        Padding(
          padding: PAD_BOTTOM_16,
          child: CustomButton.defaultStyle(
            title: "Về trang chủ",
            onPressed: () => controller.onSelectBackHome(),
          ),
        ),
      ]),
    );
  }

  Widget switchInfoType(NavigateStockTranDetail trans) {
    if (trans.stockTransactionType == StockOrderType.buy) {
      return StockBuyTransactionDetailInfo(
          controller.navigateStockTranDetail.transaction);
    } else {
      return StockSellTransactionDetailInfo(
          controller.navigateStockTranDetail.transaction);
    }
  }
}
