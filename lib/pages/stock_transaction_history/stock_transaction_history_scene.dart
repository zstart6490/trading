import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/pages/stock_transaction_history/components/transaction_section.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomRefresher.dart';
import 'package:trading_module/shared_widgets/ListNoDataBackground.dart';

import 'stock_transaction_history_controller.dart';

class ListTransactionScene extends GetView<StockTransactionController> {
  const ListTransactionScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<StockTransactionController>(
      title: "Lịch sử giao dịch",
      body: controller.obx(
            (state) => Padding(
          padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
          child: CustomRefresher(
            controller: controller.refreshController,
            onLoading: () => controller.onLoading(),
            onRefresh: () => controller.onRefresh(),
            child: CustomScrollView(
              slivers: List.generate(state!.keys.length, (index) {
                final key = state.keys.elementAt(index);
                return TransactionSection(
                  headerTime: key,
                  sectionData: state[key]!,
                  onPressed: (tran) => controller.onTapped(tran),
                );
              }),
            ),
          ),
        ),
        onEmpty: ListNoDataBackground.png(
          "assets/images/png/empty_bg.png",
          desc: "Bạn chưa thực hiện giao dịch nào",
          padding: PAD_SYM_H40,
        ),
      ),
    );
  }
}
