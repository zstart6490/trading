import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/data/entities/naptien/NavigateData.dart';
import 'package:trading_module/data/entities/naptien/SavingProduct.dart';
import 'package:trading_module/pages/deposit/input_money/base_input_money_controller.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/util.dart';

class TDInputMoneyLocalController extends TDBaseInputMoneyController {
  late TextEditingController textEditingController;

  late FocusNode focusNode;
  TDInputMoneyLocalController({required SavingProduct product}) : super(product);
  RxDouble percent = 0.0.obs;
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
    //caculateInterest(inputAmount);
    super.onReady();
  }

  void next() {
    final amount = int.parse(textEditingController.text.numericOnly()) *
        product.multipleOf;
    Get.toNamed(AppRoutes.tdTransactionConfirm,
        arguments: NavigateTransferData(amount: amount, product: product));
    // Get.toNamed(Routes.transferType,
    //     arguments: NavigateTransferData(amount: amount, product: product));
  }

  void onChangeMoney(String val) {
    log(val);
    final str = val.numericOnly();
    if (product.investType == InvestType.normal) {
      inputAmount = int.tryParse(str) ?? 0;
    } else {
      inputAmount = (int.tryParse(str) ?? 0) * product.multipleOf;
    }
    checkMoneyValid();
    updateMoneysuggest();
    //caculateInterest(inputAmount);
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
  }



  int getAmountFromString(String str) {
    return int.tryParse(str.numericOnly()) ?? 0;
  }

  Future<void> onCallSupport() async {
    //GetInstance().find<MainProvider>().supportByPhone();
  }

  void onFocusChange() {
    showMoneySuggess =
        product.investType == InvestType.normal && focusNode.hasFocus;
    update();
  }

  void updateMoneysuggest() {
    update();
  }
}
