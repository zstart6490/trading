import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/cores/stock_price_socket.dart';
import 'package:trading_module/data/entities/socket_stock_event.dart';
import 'package:trading_module/data/entities/stock_price.dart';
import 'package:trading_module/data/repos/stock_repo_impl.dart';
import 'package:trading_module/data/services/local/stock_storage_service.dart';
import 'package:trading_module/data/services/stock_service.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/stock_usecase.dart';
import 'package:trading_module/routes/app_navigate.dart';

class SelectStockController extends BaseController
    with StateMixin<List<StockModel>> {
  final StockUseCase _stockUseCase = StockUseCase(StockRepoImpl(StockServiceImpl(),StockStorageServiceImpl()));
  final StockPriceSocket stockPriceSocket = Get.find<StockPriceSocket>();
  final nameHolder = TextEditingController();
  List<StockModel> listStock = <StockModel>[];
  Rx<bool> hiddenRemoveSearch = true.obs;
  RefreshController refreshController =
  RefreshController(initialRefresh: false);
  SelectStockController();

  String getTitleScreen() {
    return "Chọn mã CP muốn mua";
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getListCache();
    getListStock();
    super.onReady();
  }

  Future getListCache() async{
    showProgressingDialog();
    final result = await _stockUseCase.getListCache();
    hideDialog();
    if (result.data != null) {
      listStock = result.data!;
      change(listStock, status: RxStatus.success());
    } else if (result.error != null) {
      showSnackBar(result.error!.message);
      change(null, status: RxStatus.error(result.error!.message));
    }
    subscribe();
  }

  @override
  void onClose() {
    stockPriceSocket.unSubscribeStock();
  }

  Future getListStock() async {
    showProgressingDialog();
    final result = await _stockUseCase.getList();
    hideDialog();

    if (result.data != null) {
      listStock = result.data!;
      change(listStock, status: RxStatus.success());
      subscribe();
    } else if (result.error != null) {
      showSnackBar(result.error!.message);
      // change(null, status: RxStatus.error(result.error!.message));
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
    navToBuyStock(stock);
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



  Future onRefresh() async{
    await getListStock();
    refreshController.refreshCompleted();
  }
}
