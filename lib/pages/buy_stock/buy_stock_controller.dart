import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/utils/enums.dart';



class BuyStockController extends BaseController with StateMixin<StockModel> {
  final StockModel stock;
  late TextEditingController textEditingController;
  late FocusNode focusNode;
  bool reverseViewPaymentContent = false;

  Rx<ConditionState> overBuy = ConditionState.none.obs;

  Rx<bool> isShowToolTip = false.obs;

  bool get isValid => overBuy.value == ConditionState.success;

  BuyStockController(this.stock);

  @override
  void onInit() {
    super.onInit();
    focusNode = FocusNode();
    focusNode.addListener(() => onFocusChange());
    textEditingController = TextEditingController();
  }

  @override
  void onReady() {
    change(stock, status: RxStatus.success());
    //getPositionWidget();
    super.onReady();
  }


  void openHomeTrading() {
    Get.offAndToNamed(AppRoutes.mainView);
  }


  void onChangeMoney(String val) {
    if (val.length > 5) {
      overBuy.value = ConditionState.error;
    } else {
      overBuy.value = ConditionState.none;
    }
  }

  void next() {
    print("ABCD");
    overBuy.value = ConditionState.error;
  }


  void showToolTip(){
    print(isShowToolTip.value);
    isShowToolTip.value = !isShowToolTip.value;
  }

  void onFocusChange() {
    update();
  }

  Offset getOffsetWidget(GlobalKey globalKey) {
    final RenderBox? renderBox =
    globalKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;
  }



}