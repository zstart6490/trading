import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/stock_use_case.dart';
import 'package:trading_module/routes/app_routes.dart';

class MarketController extends BaseController
    with StateMixin<List<StockModel>> {
  final StockUseCase _stockUseCase = Get.find<StockUseCase>();
  final nameHolder = TextEditingController();
  List<StockModel> listStock = <StockModel>[];

  Rx<bool> hiddenRemoveSearch = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getListStock();
    super.onReady();
  }

  void getListStock() async {
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
    }else {
      change(null, status: RxStatus.empty());
    }
  }

  void onTapped(StockModel stock) {
    Get.toNamed(AppRoutes.tdBuyStock, arguments: stock);
  }
}
