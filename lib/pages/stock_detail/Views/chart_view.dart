import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trading_module/pages/stock_detail/Views/chart_view_controller.dart';

import 'package:trading_module/utils/util.dart';

class ChartView extends GetView<ChartController> {
  const ChartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (candle) => Column(
        children: [
          Expanded(
            child: Candlesticks(
              candles: candle!,
            ),
          ),
          SIZED_BOX_H16,
          StockMenuView(controller: controller),
        ],
      ),
      onError: (error) => Text(error ?? "Load Content Error!"),
      onEmpty: const SizedBox(),
    );
  }
}

class StockMenuView<T extends ChartController> extends StatelessWidget {
  const StockMenuView({Key? key, required this.controller}) : super(key: key);
  final T controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        height: 40.0,
        padding: const EdgeInsets.all(2.0),
        //margin: PAD_SYM_H12,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0), color: Colors.white),
        child: TabBar(
          controller: controller.tabController,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(
              100.0,
            ),
            color: const Color(0xFFF5F6FA),
          ),
          labelPadding: const EdgeInsets.all(2.0),
          labelStyle: context.textSize12.copyWith(
            fontWeight: FontWeight.w600,
          ),
          labelColor: increaseColor,
          unselectedLabelColor: context.disabledColor,
          unselectedLabelStyle:
              context.textSize12.copyWith(color: context.disabledColor),
          tabs: List.generate(controller.timeRange.length, (index) {
            return Tab(
              text: controller.timeRange[index],
            );
          }),
        ),
      ),
    );
  }
}
