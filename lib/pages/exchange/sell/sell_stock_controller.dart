import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/data/entities/navigate_stock_trans_detail.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/entities/stock_order_info.dart';
import 'package:trading_module/domain/entities/stock_transaction_detail.dart';
import 'package:trading_module/pages/exchange/exchange_stock_controller.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';
import 'package:trading_module/theme/app_color.dart';
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
  RxBool autoFocus = true.obs;
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
      loadingCalculatorAmount.value = false;
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
                  text: "Bạn chắc chắn muốn bán",
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
                          " chưa bao gồm ${stockOrderInfo?.fee.toCurrency() ?? 0} phí bán và ${stockOrderInfo?.feePartner.toCurrency() ?? 0} phí giao dịch.",
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
                    hideDialog();
                    focusNode.unfocus();
                    autoFocus.value = false;
                    confirmSellStock();
                  }),
            ]),
        dismissable: false);
  }

  Future confirmSellStock() async {
    isShowToolTip.value = false;
    showProgressingDialog();
    final requestAmount =
        int.tryParse(textEditController.text.numericOnly()) ?? 0;
    final result = await stockExchangeUseCase.confirmSellOrderInfo(
        symbol: stockModel.symbol,
        price: stockModel.lastPrice,
        quantity: requestAmount);
    hideDialog();
    if (result.data != null) {
      final StockTransactionDetail stockTransactionDetail = result.data!;
      //order success
      //order success
      refreshAccountInfo();
      showDialogConfirm(stockTransactionDetail);
    }
    if (result.error != null) {
      showSnackBar(result.error!.message);
    }
  }

  void showDialogConfirm(StockTransactionDetail stockTransactionDetail) {
    showAlertDialog(
      CustomAlertType2tDialog(
        title: "Đặt lệnh bán thành công",
        titleWidget: Column(
          children: [
            "ic_dialog_success_orderstock".pngImage(),
            SIZED_BOX_H12,
            Text(
              "Đặt lệnh bán thành công",
              style: Get.context!.textSize16.copyWith(color: COLOR_333333),
            ),
            SIZED_BOX_H06,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Lệnh của bạn sẽ khớp trong thời gian sớm nhất.\n",
                  style: Get.context!.textSize12,
                  children: [
                    TextSpan(
                        text: "*Thời gian giao dịch: ",
                        style: Get.context!.textSize12),
                    TextSpan(
                      text: "09:00-14:45 hàng ngày\n",
                      style: Get.context!.textSize12
                          .copyWith(color: Get.context!.primaryColor),
                    ),
                    TextSpan(
                        text: " (trừ thứ bảy, chủ nhật và ngày lễ)",
                        style: Get.context!.textSize12),
                  ]),
            )
          ],
        ),
        actions: [
          SizedBox(
            width: 155,
            height: 40,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(borderRadius: BOR_RAD8),
                  side: BorderSide(
                      color: Get.context!.backgroundColor, width: 0.5),
                  primary: Get.context!.primaryColor,
                  elevation: 0,
                ),
                onPressed: () {
                  Get.until((route) => Get.currentRoute == AppRoutes.mainView);
                },
                child: AutoSizeText(
                  'Đồng ý',
                  maxLines: 1,
                  minFontSize: 10,
                  style: Get.context!.textSize14
                      .copyWith(color: Get.context!.backgroundColor),
                )),
          ),
          SIZED_BOX_H08,
          Material(
            color: Colors.transparent,
            shadowColor: Colors.transparent,
            child: InkWell(
              child: Text(
                "Chi tiết lệnh",
                style: Get.context!.textSize14.copyWith(
                    color: Get.context!.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () => {
              // Get.offNamedUntil(AppRoutes.stTransactionDetail,
              // ModalRoute.withName(AppRoutes.mainView),
              // arguments: NavigateStockTranDetail(
              // stockTransactionDetail, StockOrderType.sell));

                Get.toNamed(AppRoutes.stTransactionDetail,
                    arguments: NavigateStockTranDetail(
                        stockTransactionDetail, StockOrderType.sell))
              },
            ),
          )
        ],
      ),
      dismissable: false,
    );
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
