import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/pages/exchange/buy/buy_stock_controller.dart';
import 'package:trading_module/pages/exchange/components/stock_buy_amount_component.dart';
import 'package:trading_module/pages/exchange/components/stock_exchange_view.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/utils/extensions.dart';

class BuyStockScene extends GetView<BuyStockController> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<BuyStockController>(
      title: "buy_stock".tr,
      elevation: 0.3,
      actions: [
        IconButton(
          icon: "ic_info".pngImage(),
          onPressed: () =>   Get.toNamed(AppRoutes.stockMoreDetail, arguments: controller.stockModel),
        )
      ],
      backgroundColor: context.scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
              child: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                StockExchangeView<BuyStockController>(),
                SIZED_BOX_H08,
                const StockBuyAmountComponent(),
              ])),
            ],
          )),
          Padding(
            padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: (MediaQuery.of(context).viewInsets.bottom) + 16,
                top: 16),
            child: Obx(
              () => CustomButton(
                  title: "btn_buy".tr,
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
