import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/pages/exchange/components/stock_exchange_view.dart';
import 'package:trading_module/pages/exchange/components/stock_sell_amount_component.dart';
import 'package:trading_module/pages/exchange/sell/sell_stock_controller.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/utils/extensions.dart';

class SellStockScene extends GetView<SellStockController> {
  const SellStockScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<SellStockController>(
      title: "sell_stock".tr,
      backgroundColor: context.scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const ScrollPhysics(),
              children: [
                StockExchangeView<SellStockController>(),
                SIZED_BOX_H16,
                const StockSellAmountComponent(),
                SIZED_BOX_H08,
              ],
            ),
          ),
          Padding(
            padding: PAD_BOTTOM_16,
            child: Obx(() => CustomButton(
                title: "btn_sell".tr,
                bgColor: controller.canConfirm.value?Colors.green:Colors.grey,
                onPressed: controller.canConfirm.value
                    ? () => controller.onConfirmAmount()
                    : null
            ),),
          )
        ],
      ),
    );
  }
}
