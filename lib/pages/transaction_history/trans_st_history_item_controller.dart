import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/data/entities/navigate_stock_trans_detail.dart';
import 'package:trading_module/domain/entities/list_order_transaction.dart';
import 'package:trading_module/domain/entities/stock_transaction_history.dart';
import 'package:trading_module/domain/use_cases/history_order_usecase.dart';
import 'package:trading_module/routes/app_navigate.dart';
import 'package:trading_module/utils/enums.dart';

class TransStockHistoryController extends BaseController
    with GetSingleTickerProviderStateMixin, StateMixin<List<OrderRecord>> {
  late TabController tabController;
  final timeRange = ["Mua", "Bán"];
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final StockHistoryOrderUseCase _stockHistoryOrderUseCase =
      Get.find<StockHistoryOrderUseCase>();
  String orderType = "BUY";
  int page = 1;
  int limit = 1000;
  List<OrderRecord> listOrderRecord = [];

  @override
  void onInit() {
    tabController = TabController(length: timeRange.length, vsync: this);

    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        if (tabController.index == 0) {
          orderType = "BUY";
          page = 1;
          getListOrder();
        } else {
          orderType = "SELL";
          page = 1;
          getListOrder();
        }
      }
    });
    getListOrder();
    super.onInit();
  }

  Future getListOrder() async {
    change([], status: RxStatus.loading());
    listOrderRecord.clear();
    final result =
        await _stockHistoryOrderUseCase.getList(orderType, page, limit);
    if (result.data != null) {
      if (result.data!.records.isNotEmpty) {
        listOrderRecord.addAll(result.data!.records);
        change(listOrderRecord, status: RxStatus.success());
      } else {
        change([], status: RxStatus.empty());
      }
    }
    if (result.error != null) {
      showSnackBar(UNKNOWN_ERROR);
      change([], status: RxStatus.empty());
    }
  }

  Future onLoading() async {
    page++;
    change([], status: RxStatus.loadingMore());
    final result =
        await _stockHistoryOrderUseCase.getList(orderType, page, limit);
    if (result.data != null) {
      if (result.data!.records.isNotEmpty) {
        listOrderRecord.addAll(result.data!.records);
        change(listOrderRecord, status: RxStatus.success());
      }
    }
    refreshController.loadComplete();
  }

  Future onRefresh() async {
    page = 1;
    await getListOrder();
    refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Future onClickStock(StockTransactionHistory data) async {
    showProgressingDialog();
    final result = await _stockHistoryOrderUseCase.getOrderDetail(id: data.id);
    hideDialog();
    if (result.data != null) {
      StockOrderType stockTransactionType = StockOrderType.buy;
      if (orderType == "BUY") {
        stockTransactionType = StockOrderType.buy;
      } else {
        stockTransactionType = StockOrderType.sell;
      }
      final NavigateStockTranDetail navigateStockTranDetail =
          NavigateStockTranDetail(result.data!, stockTransactionType);
      navToStockTransactionDetail(navigateStockTranDetail);
    }
    if (result.error != null) {
      showSnackBar(UNKNOWN_ERROR);
    }
  }
}
