import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/service_api_config.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/cores/stock_price_socket.dart';
import 'package:trading_module/data/entities/socket_stock_event.dart';
import 'package:trading_module/data/entities/stock_price.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/stock_use_case.dart';
import 'package:trading_module/pages/main_tabbar/main_tabbar_controller.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/sse/flutter_client_sse.dart';

class MarketController extends BaseController
    with StateMixin<List<StockModel>> {
  final StockUseCase _stockUseCase = Get.find<StockUseCase>();
  final nameHolder = TextEditingController();
  List<StockModel> listStock = <StockModel>[];
  final StockPriceSocket stockPriceSocket = Get.find<StockPriceSocket>();
  Rx<bool> hiddenRemoveSearch = true.obs;


  @override
  void onReady() {
    getListStock();
    super.onReady();
  }

  void subscribe() {
    final symbols = listStock.map((e) => e.symbol).toList();
    stockPriceSocket.subscribeStock(
      symbols,
          (p0) {
        updateListStock(p0);
      },
    );
  }

  void updateListStock(SocketStockEvent stock) {
    for (var i = 0; i < listStock.length; i++) {
      final StockPrice stockPrice = stock.stockPrice;
      if (listStock[i].symbol == stockPrice.symbol) {
        listStock[i].lastPrice = stockPrice.price ?? 0;
        listStock[i].ratioChange = stockPrice.chg ?? 0;
        change(listStock, status: RxStatus.success());
        break;
      }
    }
  }


  @override
  void onClose(){
    SSEClient.unsubscribeFromSSE();
  void onClose() {
    stockPriceSocket.unSubscribeStock();
  }

  @override
  Future<bool> onWillPop() {
    stockPriceSocket.unSubscribeStock();
    final TDMainTabController tdMainTabController = Get.find();
    if (tdMainTabController.tabIndex != 0){
      backToTabHome();
      return Future.value(false);
    }
    return Future.value(true);
  }

  Future getListStock() async {
    showProgressingDialog();
    final result = await _stockUseCase.getList();
    hideDialog();
    if (result.data != null) {
      listStock = result.data!;
      change(listStock, status: RxStatus.success());
    } else if (result.error != null) {
      showSnackBar(result.error!.message);
      change(null, status: RxStatus.error());
    }
    subscribe();
  }

  void cleanSearch() {
    hiddenRemoveSearch.value = true;
    nameHolder.clear();
    change(listStock, status: RxStatus.success());
  }

  void onChangeSearchStock(String name) {
    hiddenRemoveSearch.value = name.isEmpty;
    final stocks = listStock
        .where((e) => e.symbol.toUpperCase().startsWith(name.toUpperCase()))
        .toList();
    if (stocks.isNotEmpty) {
      change(stocks, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.empty());
    }
  }

  void onTapped(StockModel stock) {
    Get.toNamed(AppRoutes.stockDetail, arguments: stock);
  }

  void subscribe() {
    final symbols = listStock.map((e) => e.symbol).toList();
    final stock = symbols.join('-');
    SSEClient.subscribeToSSE(
        url: '${Environment().maketUrl}/stock/v1/subscribe/$stock',
        header: {
          "Authorization": mainProvider.accessToken ?? "",
          "Cache-Control": "no-cache",
        }).listen((event) {
      if (event.data != null) {
        final RealTimeStock stockInfo =
            RealTimeStock.fromJson(jsonDecode(event.data.toString()));
        updateListStock(stockInfo);
      }
    });

    SSEClient.unsubscribeFromSSE();
  }


  void backToTabHome() {
    final TDMainTabController tdMainTabController = Get.find();
    if (tdMainTabController.tabIndex != 0) tdMainTabController.tabIndex = 0;

  }
}
