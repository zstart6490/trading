import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/cores/stock_price_socket.dart';
import 'package:trading_module/domain/entities/my_stock_model.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/stock_exchange_usecase.dart';
import 'package:trading_module/routes/app_routes.dart';

class StockDetailController extends BaseController
    with StateMixin<MyStockModel>, GetSingleTickerProviderStateMixin {
  final StockExchangeUseCase _stockUseCase = Get.find<StockExchangeUseCase>();

  StockPriceSocket stockPriceSocket = Get.find();
  final StockModel stock;

  StockDetailController(this.stock);

  final timeRange = ["Tổng quan".tr, "Tài chính".tr, "Tin tức".tr];
  late TabController tabController;

  final int countItem = 12;

  RxDouble priceStock = 0.0.obs;
  RxBool isValid = false.obs;

  @override
  void onInit() {
    priceStock.value = stock.lastPrice;
    tabController = TabController(length: timeRange.length, vsync: this);
    tabController.addListener(() {});
    super.onInit();
  }

  @override
  void onReady() {
    getStockDetail();

    super.onReady();
  }

  @override
  void onClose() {
    stockPriceSocket.unSubscribeStock();
    super.onClose();
  }

  @override
  Future<bool> onWillPop() {
    stockPriceSocket.unSubscribeStock();
    return super.onWillPop();
  }

  Future<void> getStockDetail() async {
    final result = await _stockUseCase.getStockDetail(symbol: stock.symbol);

    if (result.data != null) {
      result.data?.portfolioHistoryList?.insert(0, PortfolioModel(price: 0));
      priceStock.value = result.data?.lastPrice ?? 0;
      _checkValidateSell(result.data?.quantity ?? 0);
      change(result.data, status: RxStatus.success());
      subsStock();
      stock.stockName = result.data?.stockName ?? "";
      stock.lastPrice = result.data?.lastPrice ?? 0;
      stock.imageUrl = result.data?.imageUrl ?? "";
    } else if (result.error != null) {
      change(null, status: RxStatus.error());
      showSnackBar(UNKNOWN_ERROR);
    }
  }

  void _checkValidateSell(double quantitySell) {
    if (quantitySell > 0) {
      isValid.value = true;
    } else {
      isValid.value = false;
    }
  }

  void subsStock() {
    stockPriceSocket.subscribeStock(
      [stock.symbol],
      (event) {
        if (stock.symbol == event.stockPrice.symbol &&
            stock.lastPrice != event.stockPrice.price) {
          priceStock.value = event.stockPrice.price ?? 0;
        }
      },
    );
  }

  void buyTapped() {
    Get.toNamed(AppRoutes.buyStock, arguments: stock);
  }

  void sellTapped() {
    Get.toNamed(AppRoutes.sellStock, arguments: stock);
  }

  void selTab(int index) {
    tabController.animateTo(index);
  }

  void onTapped() {
    Get.toNamed(AppRoutes.stockMoreDetail, arguments: stock);
  }

  void infoTapped() {
    Get.toNamed(AppRoutes.stockMoreDetail, arguments: stock);
  }
}
