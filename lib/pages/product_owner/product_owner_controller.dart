import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/product_own.dart';
import 'package:trading_module/domain/use_cases/user_stock_usecase.dart';
import 'package:trading_module/routes/app_navigate.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';
import 'package:trading_module/utils/util.dart';

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
      if (result.data!.isNotEmpty) {
        change(listStock, status: RxStatus.success());
      } else {
        change(listStock, status: RxStatus.empty());
      }
    } else if (result.error != null) {
      showSnackBar(UNKNOWN_ERROR);
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
    textSearch.value = name;
    final stocks = listStock
        .where((e) => e.productKey.toUpperCase().startsWith(name.toUpperCase()))
        .toList();
    if (stocks.isNotEmpty) {
      change(stocks, status: RxStatus.success());
    } else {
      change([], status: RxStatus.empty());
    }
  }

  void onTapped(ProductOwn stock) {
    if (stock.quantity <= 0) {
      final subtitleStyle =
          Get.context!.textSize12.copyWith(color: const Color(0xFF5C5C5C));
      showAlertDialog(CustomAlertDialog(
          descWidget: Column(
            children: [
              "sell_stock_validation".pngImage(mWidth: 132, mHeight: 100),
               Text("Hiện chưa thể bán mã này",
                  textAlign: TextAlign.center,
                  style: Get.context!.textSize16.copyWith(
                      fontFamily: 'iCielHelveticaNowText',
                      color: const Color(0xFF333333),
                      fontWeight: FontWeight.w700),),
              SIZED_BOX_H06,
              RichText(
                textAlign: TextAlign.center,
                maxLines: 4,
                text: TextSpan(
                  text: "Sau",
                  style: subtitleStyle,
                  children: <TextSpan>[
                    TextSpan(
                        text: " 2 ngày ",
                        style: subtitleStyle.copyWith(
                            color: Colors.green, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            "thực hiện giao dịch mua thành công, CP về tại tài khoản ",
                        style: subtitleStyle.copyWith(
                            color: const Color(0xFF5C5C5C))),
                    TextSpan(
                        text: "\"CP có thể bán\" ",
                        style: subtitleStyle.copyWith(
                            color: const Color(0xFF5C5C5C),
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "mới giao dịch bán được.\n",
                        style: subtitleStyle.copyWith(
                            color: const Color(0xFF5C5C5C))),
                    TextSpan(
                        text: "(Không kể thứ bảy, chủ nhật và ngày lễ)",
                        style: subtitleStyle.copyWith(
                            color: const Color(0xFF5C5C5C))),
                  ],
                ),
              )
            ],
          ),
          actions: [
            AlertAction(
                text: "Tôi đã hiểu",
                isDefaultAction: true,
                onPressed: () => hideDialog())
          ]));
    } else {
      navToSellStock(stock.toStockModel());
    }
  }

  void buyStock() {
    navToSelectStock();
  }

  @override
  Future<bool> onWillPop() {
    return super.onWillPop();
  }
}
