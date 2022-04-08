import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/my_stock_model.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/stock_exchange_usecase.dart';
import 'package:trading_module/routes/app_routes.dart';


class StockDetailController extends  BaseController
    with StateMixin<MyStockModel>, GetSingleTickerProviderStateMixin{
  final StockExchangeUseCase _stockUseCase = Get.find<StockExchangeUseCase>();
  final StockModel stock;
  StockDetailController(this.stock);

  final timeRange = ["Tổng quan".tr, "Tài chính".tr, "Tin tức".tr];
  late TabController tabController;

  final int countItem = 12;

  @override
  void onInit() {
    tabController = TabController(length: timeRange.length, vsync: this);
    tabController.addListener(() {});
    super.onInit();
  }

  @override
  void onReady() {
    getStockDetail();
    super.onReady();
  }

  Future<void> getStockDetail() async {
    final result = await _stockUseCase.getStockDetail(symbol: stock.symbol);

    if (result.data != null) {
      result.data?.portfolioHistoryList?.insert(0, PortfolioModel());
      change(result.data, status: RxStatus.success());
    } else if (result.error != null) {
      change(null, status: RxStatus.error());
      showSnackBar(result.error!.message);
    }
  }

  void buyTapped() {
    Get.toNamed(AppRoutes.buyStock, arguments: stock);
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


