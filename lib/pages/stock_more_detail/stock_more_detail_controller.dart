import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/stock_current_price_model.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/stock_exchange_usecase.dart';
import 'package:trading_module/domain/use_cases/stock_use_case.dart';
import 'package:trading_module/routes/app_routes.dart';


class StockMoreDetailController extends  BaseController
    with StateMixin<StockCurrentPriceModel>, GetSingleTickerProviderStateMixin{

  final StockModel stock;
  StockMoreDetailController(this.stock);

  final StockUseCase _stockUseCase = Get.find<StockUseCase>();
  final StockExchangeUseCase _stockExchangeUseCase = Get.find<StockExchangeUseCase>();


  final timeRange = ["Tổng quan".tr, "Tài chính".tr, "Tin tức".tr];
  late TabController tabController;

  final int countItem = 12;

  RxBool isFollow = false.obs;

  @override
  void onInit() {
    tabController = TabController(length: timeRange.length, vsync: this);
    tabController.addListener(onTabChange);
    super.onInit();
  }

  @override
  void onReady() {
    getCurrentStockPrice();
    super.onReady();
  }


  Future<void> getCurrentStockPrice() async {
    final result = await _stockUseCase.getCurrentStockPrice(symbol: stock.symbol);
    if (result.data != null) {
      change(result.data, status: RxStatus.success());
    } else if (result.error != null) {
      change(null, status: RxStatus.error());
      showSnackBar(result.error!.message);
    }
  }

  void onTabChange() {
    debugPrint("TabChange :${tabController.index}");
    if (tabController.index == 0) {

    } else if (tabController.index == 1) {

    } else if (tabController.index == 2) {

    }
  }

  void selTab(int index) {
    tabController.animateTo(index);
    print(index);
  }

  void buyTapped() {
    Get.toNamed(AppRoutes.buyStock, arguments: stock);
  }

  void sellTapped() {
    Get.toNamed(AppRoutes.sellStock, arguments: stock);
  }

  void follow() async{
    final isFlow =  !isFollow.value;
    final result = await _stockExchangeUseCase.addFollowing(stock: stock.symbol, type: "0", isFlow: isFlow);
    if (result.data != null){
      isFollow.value =  isFlow;
    }
  }
}
