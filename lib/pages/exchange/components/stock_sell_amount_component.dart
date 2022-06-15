import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:simple_tooltip/simple_tooltip.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/states/base_view_model.dart';
import 'package:trading_module/pages/deposit/input_money/money_text_field.dart';
import 'package:trading_module/pages/exchange/sell/sell_stock_controller.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/extensions.dart';

class StockSellAmountComponent extends BaseViewModel<SellStockController> {
  const StockSellAmountComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget child(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.backgroundColor,
      child: Padding(
        padding: PAD_ALL16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Text(
                "Nhập Số Cổ Phiếu Muốn Bán",
                style: context.textSize16,
              ),
            ),
            SIZED_BOX_H08,
            Row(
              children: [
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 16, 12, 16),
                                  child: MoneyInputComponent(
                                    investType: InvestType.stock,
                                    focusNode: controller.focusNode,
                                    textEditingController:
                                        controller.textEditController,
                                    onChangeMoney: (val) =>
                                        controller.onChangeMoney(val),
                                    multipleOf: 9,
                                    state: controller.overBuy.value,
                                  ))),
                        ],
                      ),
                      SIZED_BOX_H16,
                      Visibility(
                          visible:
                              controller.overBuy.value == ConditionState.error,
                          child: Text(
                              "Vượt số lượng cổ phiếu bạn đang nắm giữ. Vui lòng thử lại.",
                              style: TextStyle(
                                  color: context.errorColor, fontSize: 14))),
                      SIZED_BOX_H16,
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            "Số CP có thể bán",
                            style: context.textSize14.copyWith(
                              color: context.disabledColor,
                            ),
                          )),
                          widgetAmountStock(context)
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              Text(
                                "Giá trị dự tính",
                                style: context.textSize14
                                    .copyWith(color: context.disabledColor),
                              ),
                              SIZED_BOX_W10,
                              InkWell(
                                onTap: () => controller.showToolTip(),
                                child: SimpleTooltip(
                                    arrowBaseWidth: 18,
                                    //minWidth: MediaQuery.of(context).size.width - 150,
                                    arrowLength: 10,
                                    arrowTipDistance: 4,
                                    // maxWidth: MediaQuery.of(context).size.width,
                                    ballonPadding: const EdgeInsets.symmetric(
                                        horizontal: 2, vertical: 1),

                                    borderRadius: 2,
                                    borderColor: const Color(0xFF606060),
                                    borderWidth: 1,
                                    backgroundColor: const Color(0xFF333333),
                                    minimumOutSidePadding: 12.0,
                                    animationDuration:
                                        const Duration(milliseconds: 250),
                                    show: controller.isShowToolTip.value,
                                    hideOnTooltipTap: true,
                                    tooltipDirection: TooltipDirection.down,
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                        "Là số tiền dự kiến bạn sẽ nhận được khi thực hiện bán cổ phiếu.",
                                        style: context.textSize12
                                            .copyWith(color: Colors.white, height: 1.3)
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                        "Chưa bao gồm:",
                                        style: context.textSize12
                                            .copyWith(color: Colors.white, height: 1.3)
                                        ),
                                        const SizedBox(height: 6),
                                        Text("${controller.feePartner.value.toCurrency()} phí bán.",
                                            style: context.textSize12
                                                .copyWith(color: Colors.white)),
                                        const SizedBox(height: 6),
                                        Text("${controller.feeTransaction.value.toCurrency()} phí giao dịch.",style: context.textSize14
                                            .copyWith(color: Colors.white)),
                                      ],

                                    ),
                                    child: const Icon(
                                      Icons.info,
                                      color: Color(0xFF9AA0A5),
                                      size: 18,
                                    )),
                              ),
                            ],
                          )),
                          Container(
                            child: widgetCalculatorValue(context),
                          ),
                        ],
                      )
                    ])),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget widgetAmountStock(BuildContext context) {
    if (controller.loadingQuantityMaximum.value) {
      return LoadingAnimationWidget.waveDots(
        color: Colors.black,
        size: 20,
      );
    } else {
      return  Text(
        "${controller.quantityMaximum.value.toStockQuantity()} CP",
        style: context.textSize14.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w700),
      );
    }
  }
  Widget widgetCalculatorValue(BuildContext context) {
    if (controller.loadingCalculatorAmount.value) {
      return LoadingAnimationWidget.waveDots(
        color: Colors.green,
        size: 20,
      );
    } else {
      return Text(
        controller.amountWithoutFeeTax.value.toCurrency(),
        style: context.textSize14
            .copyWith(color: Colors.green, fontWeight: FontWeight.w700),
      );
    }
  }
}
