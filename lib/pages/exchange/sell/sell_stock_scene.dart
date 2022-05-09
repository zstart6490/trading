import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/pages/exchange/components/stock_exchange_view.dart';
import 'package:trading_module/pages/exchange/components/stock_sell_amount_component.dart';
import 'package:trading_module/pages/exchange/sell/sell_stock_controller.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/utils/extensions.dart';

class SellStockScene extends GetView<SellStockController> {
  const SellStockScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<SellStockController>(
      title: "sell_stock".tr,
      elevation: 0.3,
      backgroundColor: context.scaffoldBackgroundColor,
      actions: [
        IconButton(
          icon: "ic_info".pngImage(),
          onPressed: () =>   Get.toNamed(AppRoutes.stockDetail, arguments: controller.stockModel),
        )
      ],
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const ScrollPhysics(),
              children: [
                StockExchangeView<SellStockController>(),
                SIZED_BOX_H08,
                const StockSellAmountComponent(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: (MediaQuery.of(context).viewInsets.bottom) + 16,
                top: 8),
            child: Obx(
              () => CustomButton(
                  title: "btn_sell".tr,
                  bgColor:
                      controller.canConfirm.value ? Colors.green : Colors.grey,
                  onPressed: controller.canConfirm.value
                      ? () => controller.onConfirmAmount()
                      : null),
            ),
          )
        ],
      ),
    );
  }
}
