import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/pages/stock_more_detail/stock_more_detail_controller.dart';
import 'package:trading_module/pages/stock_more_detail/tabs/financial/stock_financial_view.dart';
import 'package:trading_module/pages/stock_more_detail/tabs/news/stock_company_news_view.dart';
import 'package:trading_module/pages/stock_more_detail/tabs/overview/stock_overview_scene.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/utils/util.dart';

class StockMoreDetailScene extends GetView<StockMoreDetailController> {
  const StockMoreDetailScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<StockMoreDetailController>(
      backgroundColor: Colors.white,
      title: controller.stock.symbol,
      actions: const <Widget>[
        FollowStockComponent(),
      ],
      body:  Column(
        children: [
          Expanded(
            child: ListView(
              //padding: const EdgeInsets.only(top: 0),
              children: <Widget>[
                SIZED_BOX_H08,
                StockMenuView(controller: controller),
                SIZED_BOX_H06,
                Obx(
                      () => _buildBody(context, controller.indexTab.value),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton.trailingStyle(
                    title: "Mua",
                    textStyle: context.textSize18light,
                    trailing: const Icon(
                      null,
                    ),
                    onPressed: () {
                      controller.buyTapped();
                    },
                  ),
                ),
                SIZED_BOX_W16,
                Expanded(
                  child: CustomButton.trailingStyleBgColor(
                    title: "Bán",
                    bgColor: const Color(0xFFF46666),
                    textStyle: context.textSize18light,
                    trailing: const Icon(
                      null,
                    ),
                    onPressed: () {
                      controller.sellTapped();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(
      BuildContext context,  int indexTab) {
    if (indexTab == 0) {
      return const StockOverviewScene();
    } else if (indexTab == 1) {
      return StockFinancialView();
    } else {
      return StockCompanyNewsView();
    }
  }
}

class StockMenuView<T extends StockMoreDetailController>
    extends StatelessWidget {
  const StockMenuView({Key? key, required this.controller}) : super(key: key);
  final T controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Container(
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
        ));
  }
}

class FollowStockComponent extends GetView<StockMoreDetailController> {
  const FollowStockComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    controller.followKey = key;
    return Obx(
      () => IconButton(
        key: key,
        icon: Image.asset(
            controller.isFollow.value
                ? "assets/images/png/ic_follow.png"
                : "assets/images/png/ic_unfollow.png",
            package: "trading_module"),
        tooltip: 'Thông tin',
        onPressed: () {
          controller.follow();
        },
      ),
    );
  }
}
