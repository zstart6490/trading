import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trading_module/pages/stock_detail/Views/chart_view_controller.dart';

class ChartView extends GetView<ChartController> {
  const ChartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (candle) => Container(
        color: Colors.green,
        child: Center(
          child: Candlesticks(
            candles: candle!,
          ),
        ),
      ),
    );
  }
}
