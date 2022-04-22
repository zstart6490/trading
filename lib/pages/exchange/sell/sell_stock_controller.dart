import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/data/entities/navigate_stock_trans_detail.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/entities/stock_order_info.dart';
import 'package:trading_module/domain/entities/stock_transaction_detail.dart';
import 'package:trading_module/pages/exchange/exchange_stock_controller.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/extensions.dart';

class SellStockController extends ExchangeStockController {
  TextEditingController textEditController = TextEditingController();
  RxBool isEmptyText = true.obs;
  RxBool canConfirm = false.obs;
  Rx<bool> isShowToolTip = false.obs;
  Rx<ConditionState> overBuy = ConditionState.none.obs;
  RxDouble quantityMaximum = 0.0.obs;
  RxDouble amountWithoutFeeTax = 0.0.obs;
  RxDouble feeTransaction = 0.0.obs;
  late FocusNode focusNode;

  SellStockController(StockModel stockModel)
      : super(stockModel);

  @override
  void onInit() {
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) isShowToolTip.value = false;
    });
    super.onInit();
  }

  @override
  void onReady() {
    getDataStockOrder();
    super.onReady();
  }

  void checkRequestAmount() {
    final requestAmount =
        int.tryParse(textEditController.text.numericOnly()) ?? 0;
    canConfirm.value =
        requestAmount > 0 && requestAmount <= quantityMaximum.value;
    overBuy.value = (requestAmount > quantityMaximum.value)
        ? ConditionState.error
        : ConditionState.none;
  }

  void clearText() {
    textEditController.clear();
  }

  void onChangedStock(String val) {}

  void onInputOver() {}

  StockOrderInfo? stockOrderInfo;

  Future<bool> getDataStockOrder() async {
    final requestAmount =
        int.tryParse(textEditController.text.numericOnly()) ?? 0;
    final result = await stockExchangeUseCase.getSellOrderInfo(
        symbol: stockModel.symbol, price: stockModel.lastPrice, quantity: requestAmount);
    if (result.data != null) {
      stockOrderInfo = result.data;
      if (stockOrderInfo != null) {
        priceStock.value = stockOrderInfo?.price ?? 0;
        amountWithoutFeeTax.value = stockOrderInfo?.amountWithoutFeeTax ?? 0;
        quantityMaximum.value = stockOrderInfo?.quantityMaximum ?? 0;
      }
      return true;
    }
    if (result.error != null) {
      showSnackBar(result.error!.message);
    }
    return false;
  }

  Future onConfirmAmount() async {
    isShowToolTip.value =false;
    final result = await getDataStockOrder();
    if (!result) return;
    showAlertDialog(
        CustomAlertDialog(
            title: "Bán chứng khoán",
            descWidget: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Bạn chắc chắc muốn bán",
                  style: Get.context!.textSize14,
                  children: [
                    TextSpan(
                      text: " ${textEditController.value.text}cp",
                      style: Get.context!.textSize14.copyWith(
                        color: Get.context!.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: " mã ${stockModel.symbol} với giá dự tính ",
                    ),
                    TextSpan(
                      text: (priceStock.value).toCurrency(),
                      style: Get.context!.textSize14.copyWith(
                        color: Get.context!.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const TextSpan(
                      text: "/cp? Tổng giá trị dự tính ",
                    ),
                    TextSpan(
                      text: amountWithoutFeeTax.value.toCurrency(),
                      style: Get.context!.textSize14.copyWith(
                        color: Get.context!.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text:
                          " đã bao gồm ${stockOrderInfo?.feePercent ?? 0}% phí bán và ${stockOrderInfo?.vatPercent ?? 0}% thuế TNCN.",
                    ),
                  ]),
            ),
            actions: [
              AlertAction(
                  text: "Hủy",
                  onPressed: () {
                    //addEventTracking(Ranking(userData, target.targetId));
                    Get.back();
                  }),
              AlertAction(
                  text: "Tiếp tục",
                  isDefaultAction: true,
                  onPressed: () {
                    confirmSellStock();
                  }),
            ]),
        dismissable: false);
  }

  Future confirmSellStock() async {
    isShowToolTip.value =false;
    final requestAmount =
        int.tryParse(textEditController.text.numericOnly()) ?? 0;
    final result = await stockExchangeUseCase.confirmSellOrderInfo(
        symbol: stockModel.symbol, price: stockModel.lastPrice, quantity: requestAmount);
    if (result.data != null) {
      final StockTransactionDetail stockTransactionDetail = result.data!;

      //order success
      Get.offNamedUntil(AppRoutes.stTransactionDetail,
          ModalRoute.withName(AppRoutes.mainView),
          arguments: NavigateStockTranDetail(
              stockTransactionDetail, StockOrderType.sell));
    }
    if (result.error != null) {
      showSnackBar(result.error!.message);
    }
  }

  void showToolTip() {
    isShowToolTip.value = !isShowToolTip.value;
    if (isShowToolTip.value) focusNode.unfocus();
  }

  void onChangeMoney(String val) {
    isEmptyText.value = val.isEmpty;
    final requestAmount = int.tryParse(val.numericOnly()) ?? 0;
    final double finalAmount = (stockOrderInfo?.price ?? 0) * requestAmount;
    final double fee = (stockOrderInfo?.feePercent ?? 0) * finalAmount;
    feeTransaction.value = fee;
    amountWithoutFeeTax.value = finalAmount;
    checkRequestAmount();
  }
}
