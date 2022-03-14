import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikop/models/NavigateData.dart' show NavigateTransferData;
import 'package:tikop/models/SavingProduct.dart';
import 'package:tikop/modules/deposit/input_money/base_input_money_controller.dart';
import 'package:tikop/modules/main_provider.dart';
import 'package:tikop/routes/routes.dart';
import 'package:tikop/utils/enums.dart';
import 'package:tikop/utils/util.dart';

class InputMoneyLocalController extends BaseInputMoneyController {
  late TextEditingController textEditingController;

  late FocusNode focusNode;
  InputMoneyLocalController({required SavingProduct product}) : super(product);

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
    inputAmount = product.minMoneyUser;
    if (product.investType == InvestType.normal) {
      textEditingController =
          TextEditingController(text: inputAmount.toCurrency(symbol: ""));
      checkMoneyValid();
    } else {
      textEditingController = TextEditingController();
    }
  }

  @override
  void onReady() {
    caculateInterest(inputAmount);
    super.onReady();
  }

  void next() {
    final amount = int.parse(textEditingController.text.numericOnly()) *
        product.multipleOf;
    Get.toNamed(Routes.transactionConfirm,
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
    caculateInterest(inputAmount);
  }

  void checkMoneyValid() {
    final minMoney = product.minMoneyUser;
    if (inputAmount == 0) {
      pasMinAmount.value = ConditionState.none;
      pasMaxAmount.value = ConditionState.none;
    } else {
      pasMinAmount.value = inputAmount >= minMoney
          ? ConditionState.success
          : ConditionState.error;
      pasMaxAmount.value = inputAmount <= maxAmount
          ? ConditionState.success
          : ConditionState.error;
    }
  }

  void setMoney(int i) {
    textEditingController.text = i.toCurrency(symbol: "");
    onChangeMoney("$i");
  }

  Future<void> tikopNow() async {
    showProgressingDialog();
    final res =
        await commonRepository.getIsVerify(VerifyType.deposit, isVn: isUserVn);
    hideDialog();
    if (res.success) {
      Get.toNamed(Routes.chooseProduct);
    } else {
      Get.toNamed(Routes.eKYCBegin);
    }
  }

  int getAmountFromString(String str) {
    return int.tryParse(str.numericOnly()) ?? 0;
  }

  Future<void> onCallSupport() async {
    GetInstance().find<MainProvider>().supportByPhone();
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
