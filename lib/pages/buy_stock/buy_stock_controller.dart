import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/utils/enums.dart';


class BuyStockController extends BaseController {
  //StockModel stock;

  late TextEditingController textEditingController;
  late FocusNode focusNode;
  Rx<ConditionState> pasMinAmount = ConditionState.none.obs;
  Rx<ConditionState> pasMaxAmount = ConditionState.none.obs;

  //BuyStockController(this.stock);

  @override
  void onInit() {
    super.onInit();
    focusNode = FocusNode();
    focusNode.addListener(() => onFocusChange());
    textEditingController = TextEditingController();
  }

  void openHomeTrading() {
    Get.offAndToNamed(AppRoutes.homeTrading);

  }


  void onChangeMoney(String val) {


  }

  void next() {

  }

  void showGuide() {

  }

  void onFocusChange() {
    update();
  }
}