import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
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
  late FocusNode focusNode;
  Rx<bool> loadingCalculatorAmount = false.obs;
  Rx<bool> loadingQuantityMaximum = false.obs;
  final _inputQuantity = rxdart.BehaviorSubject<String>();

  //feeTransaction: fee giao dịch
  RxDouble feeTransaction = 0.0.obs;

  //feePartner:fee mua
  RxDouble feePartner = 0.0.obs;

  SellStockController(StockModel stockModel) : super(stockModel);

  @override
  void onInit() {
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) isShowToolTip.value = false;
    });
    _inputQuantity
        .debounce(
            (_) => rxdart.TimerStream(true, const Duration(milliseconds: 1000)))
        .switchMap((value) async* {
      yield await serverCalculatorStockOrder();
    }).listen((event) {

      checkRequestAmount();
    });
    super.onInit();
  }

  @override
  void onReady() {
    initStockTrade();
    super.onReady();
  }

  Future initStockTrade() async {
    loadingQuantityMaximum.value = true;
    final bool result = await getStockDetail();
    if (result) {
      await serverCalculatorStockOrder();
    }
  }

  void checkRequestAmount() {
    final requestAmount =
        int.tryParse(textEditController.text.numericOnly()) ?? 0;
    canConfirm.value = requestAmount > 0 &&
        requestAmount <= quantityMaximum.value &&
        amountWithoutFeeTax.value > 0;

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

  Future<bool> serverCalculatorStockOrder() async {
    final requestAmount =
        int.tryParse(textEditController.text.numericOnly()) ?? 0;
    final result = await stockExchangeUseCase.createSellOrderInfo(
        symbol: stockModel.symbol,
        price: stockModel.lastPrice,
        quantity: requestAmount);
    if (result.data != null) {
      stockOrderInfo = result.data;
      if (stockOrderInfo != null) {
        priceStock.value = stockOrderInfo?.price ?? 0;
        feeTransaction.value = stockOrderInfo?.fee ?? 0;
        feePartner.value = stockOrderInfo?.feePartner ?? 0;
        amountWithoutFeeTax.value = stockOrderInfo?.amountWithoutFeeTax ?? 0;
        quantityMaximum.value = stockOrderInfo?.quantityMaximum ?? 0;
      }
      loadingCalculatorAmount.value = false;
      loadingQuantityMaximum.value = false;
      return true;
    }
    if (result.error != null) {
      showSnackBar(result.error!.message);
    }
    return false;
  }

  Future onConfirmAmount() async {
    isShowToolTip.value = false;
    final result = await serverCalculatorStockOrder();
    if (!result) return;
    showAlertDialog(
        CustomAlertDialog(
            title: "Bán cổ phiếu",
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
    isShowToolTip.value = false;
    final requestAmount =
        int.tryParse(textEditController.text.numericOnly()) ?? 0;
    final result = await stockExchangeUseCase.confirmSellOrderInfo(
        symbol: stockModel.symbol,
        price: stockModel.lastPrice,
        quantity: requestAmount);
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

  @override
  void dispose() {
    super.dispose();
    textEditController.dispose();
    focusNode.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    _inputQuantity.close();
  }

  void onChangeMoney(String val) {
    isEmptyText.value = textEditController.value.text.isEmpty;
    // final requestAmount = int.tryParse(val.numericOnly()) ?? 0;
    // final double finalAmount = (stockOrderInfo?.price ?? 0) * requestAmount;
    // final double fee = (stockOrderInfo?.feePercent ?? 0) * finalAmount;
    // feeTransaction.value = fee.floorToDouble();
    // amountWithoutFeeTax.value = finalAmount.floorToDouble();
    // checkRequestAmount();

    _inputQuantity.add(val);
    loadingCalculatorAmount.value = true;
  }
}
