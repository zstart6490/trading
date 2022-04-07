import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class BuyStockController extends ExchangeStockController {
  TextEditingController textEditController = TextEditingController();
  RxBool isEmptyText = true.obs;
  RxBool canConfirm = false.obs;
  late FocusNode focusNode;
  RxBool autoFocus =true.obs;
  RxDouble amountMaximum = 0.0.obs;
  RxDouble amount = 0.0.obs;
  Rx<bool> isShowToolTip = false.obs;
  Rx<ConditionState> overBuy = ConditionState.none.obs;

  BuyStockController(StockModel stockModel)
      : super(stockModel);

  @override
  void onInit() {
    priceStock.value = stockModel.lastPrice;
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
    canConfirm.value = requestAmount > 0 && amount.value <= amountMaximum.value;
    overBuy.value = (amount.value > amountMaximum.value)
        ? ConditionState.error
        : ConditionState.none;
  }

  void clearText() {
    textEditController.clear();
  }

  void onChangeMoney(String val) {
    isEmptyText.value = textEditController.value.text.isEmpty;
    final requestAmount =
        int.tryParse(textEditController.text.numericOnly()) ?? 0;
    final double finalAmount = priceStock.value * requestAmount;
    final double fee = stockOrderInfo?.fee ?? 0;
    amount.value = finalAmount + fee;
    print("abc=${amount.value}");
    checkRequestAmount();
  }

  StockOrderInfo? stockOrderInfo;

  Future getDataStockOrder() async {
    final requestAmount =
        int.tryParse(textEditController.text.numericOnly()) ?? 0;
    final result = await stockExchangeUseCase.getBuyOrderInfo(
        symbol: stockModel.symbol, price: stockModel.lastPrice, quantity: requestAmount);
    if (result.data != null) {
      stockOrderInfo = result.data;
      if (stockOrderInfo != null) {
        priceStock.value = stockOrderInfo?.price ?? 0;
        amount.value = stockOrderInfo?.amount ?? 0;
        amountMaximum.value = stockOrderInfo?.amountMaximum ?? 0;
      }
    }
  }

  Future onConfirmAmount() async {
    showProgressingDialog();
    await getDataStockOrder();
    hideDialog();
    showAlertDialog(
        CustomAlertDialog(
            title: "Mua chứng khoán",
            descWidget: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Bạn chắc chắc muốn đầu tư mua",
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
                      text: amount.value.toStockCurrency(),
                      style: Get.context!.textSize14.copyWith(
                        color: Get.context!.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text:
                          " đã bao gồm ${stockOrderInfo?.feePercent ?? 0}% phí mua.",
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
                    autoFocus.value =false;
                    confirmBuyStock();
                  }),
            ]),
        dismissable: false);
  }

  Future confirmBuyStock() async {
    showProgressingDialog();
    final requestAmount =
        int.tryParse(textEditController.text.numericOnly()) ?? 0;
    final result = await stockExchangeUseCase.confirmBuyOrderInfo(
        symbol: stockModel.symbol, price: stockModel.lastPrice, quantity: requestAmount);
    hideDialog();
    if (result.data != null) {

      final StockTransactionDetail stockTransactionDetail = result.data!;
      //order success
      showDialogConfirm(stockTransactionDetail);
    }
    if (result.error != null) {
      showSnackBar(result.error!.message);
    }
  }

  void showDialogConfirm(StockTransactionDetail stockTransactionDetail) {
    showAlertDialog(
      CustomAlertType2tDialog(
        title: "Đặt lệnh mua thành công",
        titleWidget: Container(
          child: Column(
            children: [
              "ic_dialog_success_orderstock".pngImage(),
              SIZED_BOX_H12,
              Text(
                "Đặt lệnh mua thành công",
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
                        text: "09:15-14:30 hàng ngày\n",
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
                  Get.until((route)=>Get.currentRoute== AppRoutes.mainView);
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
                style: Get.context!.textSize14
                    .copyWith(color: Get.context!.primaryColor,fontWeight: FontWeight.bold),
              ),
              onTap: () => {
                Get.toNamed(AppRoutes.stTransactionDetail,
                    arguments: NavigateStockTranDetail(stockTransactionDetail,StockTransactionType.buy))
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
  }
}
