import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/product_own.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/user_stock_usecase.dart';
import 'package:trading_module/routes/app_navigate.dart';

class ProductOwnerController extends BaseController
    with StateMixin<List<ProductOwn>> {
  final UserStockUseCase _userStockUseCase = Get.find<UserStockUseCase>();
  final nameHolder = TextEditingController();
  List<ProductOwn> listStock = <ProductOwn>[];
  Rx<bool> hiddenRemoveSearch = true.obs;
  RxString textSearch = "".obs;

  ProductOwnerController();

  String getTitleScreen() {
    return "Đang sở hữu";
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
    // SSEClient.unsubscribeFromSSE();
  }

  Future getListStock() async {
    showProgressingDialog();
    final result = await _userStockUseCase.getListProductOwn();
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

  bool isSearching() => textSearch.value.isNotEmpty;

  void onChangeSearchStock(String name) {
    hiddenRemoveSearch.value = name.isEmpty;
    textSearch.value =name;
    final stocks = listStock
        .where((e) => e.productKey.toUpperCase().startsWith(name.toUpperCase()))
        .toList();
    if (stocks.isNotEmpty) {
      change(stocks, status: RxStatus.success());
    } else {
      change([], status: RxStatus.empty());
    }
  }

  void onTapped(StockModel stock) {
    navToSellStock(stock);
  }

  void buyStock(){

  }

  @override
  Future<bool> onWillPop() {
    return super.onWillPop();
  }
}
