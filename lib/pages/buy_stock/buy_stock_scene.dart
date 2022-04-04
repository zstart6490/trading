import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tooltip/simple_tooltip.dart';
import 'package:trading_module/pages/buy_stock/buy_stock_controller.dart';
import 'package:trading_module/pages/deposit/input_money/money_text_field.dart';
import 'package:trading_module/pages/homePage/views/menu_option_view.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/util.dart';

class BuyStockScene extends GetView<BuyStockController> {
  const BuyStockScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<BuyStockController>(
        title: "Mua cổ phiếu",
        backgroundColor: context.backgroundColor,
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  controller.obx(
                    (stock) => Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              stock?.fullLink ?? "",
                              width: 40,
                              height: 40,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SIZED_BOX_W10,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  stock?.symbol ?? "",
                                  style: const TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 14,
                                    fontFamily: 'iCielHelveticaNowText',
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                SIZED_BOX_H02,
                                Text(
                                  stock?.stockName ?? "",
                                  style: const TextStyle(
                                    color: Color(0xFFADADAD),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'iCielHelveticaNowText',
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            stock?.lastPrice?.getPriceStock() ?? "0.0",
                            style: const TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'iCielHelveticaNowText',
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SpaceWithCustom(
                    height: 8,
                    bgColor: Color(0xFFF5F6FA),
                  ),
                  SIZED_BOX_H12,
                  Padding(
                    padding: PAD_SYM_H16,
                    child: Text(
                      "Nhập Số Cổ phiếu muốn mua",
                      style: context.textSize16,
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding: PAD_ALL16,
                      child: MoneyInputComponent(
                        investType: InvestType.stock,
                        focusNode: controller.focusNode,
                        textEditingController: controller.textEditingController,
                        onChangeMoney: (val) => controller.onChangeMoney(val),
                        multipleOf: 9,
                        state: controller.overBuy.value,
                      ),
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                      child: Text(
                        controller.overBuy.value == ConditionState.none
                            ? ""
                            : "Sức mua của bạn không đủ. Hãy giảm khối lượng cổ phiếu hoặc nạp thêm tiền để thực hiện giao dịch.",
                        style: const TextStyle(
                          color: Color(0xFFF46666),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'iCielHelveticaNowText',
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
                    child: Row(children: const [
                      Expanded(
                        child: Text(
                          "Sức mua",
                          style: TextStyle(
                            color: Color(0xFFADADAD),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'iCielHelveticaNowText',
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Text(
                        "500.000d",
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'iCielHelveticaNowText',
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                    child: Row(children: [
                      const Text(
                        "Số tiền dự tính ",
                        style: TextStyle(
                          color: Color(0xFFADADAD),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'iCielHelveticaNowText',
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Obx(
                        () => Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () => controller.showToolTip(),
                              child: SimpleTooltip(
                                  arrowBaseWidth: 18,
                                  //minWidth: MediaQuery.of(context).size.width - 150,
                                  arrowLength: 11,
                                  ballonPadding: const EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 1),
                                  borderRadius: 2,
                                  borderColor: Color(0xFF606060),
                                  backgroundColor: Color(0xFF606060),
                                  minimumOutSidePadding: 32.0,
                                  animationDuration:
                                      const Duration(milliseconds: 250),
                                  show: controller.isShowToolTip.value,
                                  hideOnTooltipTap: true,
                                  tooltipDirection: TooltipDirection.down,
                                  content: Text(
                                    "Là số tiền dự kiến bạn sẽ nhận được khi thực hiện bán cổ phiếu.\nChưa bao gồm:\n0,1% thuế thu nhập cá nhân.\n0,1% phí bán",
                                    style: context.textSize14
                                        .copyWith(color: Colors.white),
                                  ),
                                  child: Icon(Icons.info,
                                      color: Color(0xFF9AA0A5))),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Text(
                          "150.000.000đ",
                          style: TextStyle(
                            color: (controller.overBuy.value ==
                                    ConditionState.none)
                                ? Color(0xFF333333)
                                : Color(0xFFF46666),
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            fontFamily: 'iCielHelveticaNowText',
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ]),
                  ),
                  SIZED_BOX_H16,
                ],
              ),
            ),
            Padding(
                padding: PAD_SYM_H16,
                child: CustomButton.trailingStyle(
                    title: "Mua",
                    textStyle: context.textSize18light,
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: context.backgroundColor,
                    ),
                    onPressed: () =>
                        controller.overBuy.value == ConditionState.none ? () => controller.next() : null),
              ),

          ],
        ));
  }
}
