import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/pages/transaction_history/component/st_trans_history_item_view.dart';
import 'package:trading_module/pages/transaction_history/trans_st_history_item_controller.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomRefresher.dart';
import 'package:trading_module/shared_widgets/ListNoDataBackground.dart';
import 'package:trading_module/utils/extensions.dart';

class TransactionStockHistoryScene
    extends GetView<TransStockHistoryController> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<TransStockHistoryController>(
      title: "Lịch sử",
      elevation: 0.2,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SIZED_BOX_H16,
          Container(
            height: 40.0,
            padding: const EdgeInsets.all(2.0),
            margin: PAD_SYM_H12,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color: const Color(0xFFF5F6FA)),
            child: TabBar(
                controller: controller.tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    100.0,
                  ),
                  color: Colors.white,
                ),
                labelPadding: const EdgeInsets.all(2.0),
                labelStyle: context.textSize12.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                labelColor: const Color(0xFF333333),
                unselectedLabelColor: context.disabledColor,
                unselectedLabelStyle:
                    context.textSize12.copyWith(color: context.disabledColor),
                tabs: List.generate(controller.timeRange.length, (index) {
                  return Tab(
                    text: controller.timeRange[index],
                  );
                })),
          ),
          SIZED_BOX_H16,
          Expanded(
            child: controller.obx(
                (state) => CustomRefresher(
                      controller: controller.refreshController,
                      onRefresh: controller.onRefresh,
                      onLoading: controller.onLoading,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            StockTransHistoryItemView(controller.listOrderRecord[index]),
                        itemCount: controller.listOrderRecord.length,
                      ),
                    ),
                onLoading: const Center(child: CircularProgressIndicator()),
                onError: (error) => Text(error ?? "Load Content Error!"),
                onEmpty: const ListNoDataBackground(
                  pngPath: "assets/images/png/trans_empty.png",
                  title: "Chưa có giao dịch ",
                  desc: "Bạn chưa thực hiện giao dịch nào",

                )),
          )
        ],
      ),
    );
  }
}
