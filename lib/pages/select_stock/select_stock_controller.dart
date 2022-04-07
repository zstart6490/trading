import 'package:flutter/material.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/cores/stock_price_socket.dart';
import 'package:trading_module/data/entities/socket_stock_event.dart';
import 'package:trading_module/data/entities/stock_price.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/stock_use_case.dart';
import 'package:trading_module/routes/app_navigate.dart';
import 'package:trading_module/utils/enums.dart';

class SelectStockController extends BaseController
    with StateMixin<List<StockModel>> {
  final StockUseCase _stockUseCase = Get.find<StockUseCase>();
  final StockPriceSocket stockPriceSocket = Get.find<StockPriceSocket>();
  final nameHolder = TextEditingController();
  List<StockModel> listStock = <StockModel>[];
  Rx<bool> hiddenRemoveSearch = true.obs;
  final StockType stockType;

  SelectStockController(this.stockType);

  String getTitleScreen() {
    if (stockType == StockType.market) {
      return "Chọn mã CP muốn mua";
    }
    if (stockType == StockType.owner) {
      return "Đang sở hữu";
    }
    return "Chọn mã CP muốn mua";
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getListStock();
    super.onReady();
  }

  @override
  void onClose() {
    SSEClient.unsubscribeFromSSE();
  }

  void getListStock() async {
    showProgressingDialog();
    final result = await _stockUseCase.getList();
    hideDialog();

    if (result.data != null) {
      listStock = result.data!;
      change(listStock, status: RxStatus.success());
      subscribe();
    } else if (result.error != null) {
      showSnackBar(result.error!.message);
      change(null, status: RxStatus.error());
    }
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
    if (stockType == StockType.market) {
      navToBuyStock(stock);
    }
    if (stockType == StockType.owner) {
      navToSellStock(stock);
    }
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
  Future<bool> onWillPop() {
    stockPriceSocket.unSubscribeStock();
    return super.onWillPop();
  }
}
