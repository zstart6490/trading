import 'package:flutter/material.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/states/base_view_model.dart';
import 'package:trading_module/pages/exchange/exchange_stock_controller.dart';
import 'package:trading_module/theme/app_color.dart';
import 'package:trading_module/utils/extensions.dart';

class StockExchangeView<T extends ExchangeStockController>
    extends BaseViewModel<T> {
  @override
  Widget child(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          Expanded(
              child: Row(
                children: [
                  ClipOval(
                    child: SizedBox(
                        width: 40,
                        height: 40,
                        child: controller.stockModel.fullLink.loadCacheImg(mWidth: 40,mHeight: 40)),
                  ),
                  SIZED_BOX_W12,
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.stockModel.symbol,
                            style: context.textSize14.copyWith(
                                color: COLOR_333333,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            controller.stockModel.stockName,
                            style:
                            TextStyle(
                                color: context.disabledColor, fontSize: 14),
                          )
                        ],
                      ))
                ],
              )),
          SIZED_BOX_W08,
          Text(
            controller.priceStock.value.getPriceStock(),
            style: const TextStyle(
                color: COLOR_333333, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
