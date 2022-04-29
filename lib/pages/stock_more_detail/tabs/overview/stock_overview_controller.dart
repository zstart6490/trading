import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/stock_current_price_model.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/stock_usecase.dart';

class StockOverviewController extends BaseController
    with StateMixin<StockCurrentPriceModel>, GetSingleTickerProviderStateMixin {
  final StockModel stock;

  StockOverviewController(this.stock);

  final StockUseCase _stockUseCase = Get.find<StockUseCase>();

  final timeRange = ["Tổng quan".tr, "Tài chính".tr, "Tin tức".tr];
  late Offset totalAmountOffset;
  late GlobalKey followKey;

  RxInt indexTab = 0.obs;
  RxBool isFollow = false.obs;
  StockCurrentPriceModel? _stockCurrentPriceModel;

  @override
  void onReady() {
    getCurrentStockPrice();
    super.onReady();
  }

  Future<void> getCurrentStockPrice() async {
    if (_stockCurrentPriceModel == null) {
      change(null, status: RxStatus.loading());
      final result =
          await _stockUseCase.getCurrentStockPrice(symbol: stock.symbol);
      if (result.data != null) {
        isFollow.value = result.data?.isProductWatching ?? false;
        _stockCurrentPriceModel = result.data;
        change(result.data, status: RxStatus.success());
      } else if (result.error != null) {
        change(null, status: RxStatus.error(result.error!.message));
        showSnackBar(result.error!.message);
      }
    }
  }
}
