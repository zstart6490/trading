import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/util.dart';

class TDInputMoneyLocalController extends BaseController {
  late TextEditingController textEditingController;

  late FocusNode focusNode;
  int inputAmount = 0;
  bool showMoneySuggess = false;

  Rx<ConditionState> pasMinAmount = ConditionState.none.obs;
  Rx<ConditionState> pasMaxAmount = ConditionState.none.obs;

  bool get isValid =>
      pasMinAmount.value == ConditionState.success &&
          pasMaxAmount.value == ConditionState.success;

  @override
  void onInit() {
    super.onInit();
    focusNode = FocusNode();
    focusNode.addListener(() => onFocusChange());
    textEditingController = TextEditingController();

  }

  @override
  void onReady() {
    super.onReady();
  }

  void next() {
    final amount = int.parse(textEditingController.text.numericOnly());
    Get.toNamed(AppRoutes.tdTransactionConfirm,
        arguments: amount);
  }

  void onChangeMoney(String val) {
    log(val);
    final str = val.numericOnly();
    inputAmount = int.tryParse(str) ?? 0;
    checkMoneyValid();
    updateMoneysuggest();

  }

  void checkMoneyValid() {
    if (inputAmount == 0) {
      pasMinAmount.value = ConditionState.none;
      pasMaxAmount.value = ConditionState.none;
    } else {
      pasMinAmount.value = inputAmount >= int.parse(mainProvider.configMap?.minMoneyUser ?? "500000")
          ? ConditionState.success
          : ConditionState.error;
      pasMaxAmount.value = inputAmount <= int.parse(mainProvider.configMap?.maxMoneyUser ?? "999999999999")
          ? ConditionState.success
          : ConditionState.error;
    }
  }

  void setMoney(int i) {
    textEditingController.text = i.toCurrency(symbol: "");
    onChangeMoney("$i");

    //textEditingController.text
  }



  int getAmountFromString(String str) {
    return int.tryParse(str.numericOnly()) ?? 0;
  }

  Future<void> onCallSupport() async {
    //GetInstance().find<MainProvider>().supportByPhone();
  }

  void onFocusChange() {
    update();
  }

  void updateMoneysuggest() {
    update();
  }
}
