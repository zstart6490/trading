import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/pages/main_tabbar/main_tabbar_controller.dart';
import 'package:trading_module/pages/stock_market/stock_market_sell_scene.dart';
import 'package:trading_module/utils/extensions.dart';

import '../../shared_widgets/FABBottomAppBar.dart';
import '../../shared_widgets/KeepAliveWrapper.dart';
import '../homePage/home_page.dart';



class MainTabBar extends GetView<TDMainTabController> {
  const MainTabBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBotNavBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: buildBody(),
    );
  }

  Widget buildBotNavBar(BuildContext context) {
    return FABBottomAppBar(
      controller: controller.tabController,
      items: [
        FABBottomAppBarItem(
          title: "Tài sản".tr,
          inActivePath: "assets/images/svg/tabbar_property.svg",
          activePath: "assets/images/svg/tabbar_property_active.svg",
        ),
        FABBottomAppBarItem(
          title: "Thị trường".tr,
          inActivePath: "assets/images/svg/tabbar_market.svg",
          activePath: "assets/images/svg/tabbar_market_active.svg",
        ),
      ],
      color: const Color(0xFFADADAD),
      selectedColor: context.primaryColor,
      notchedShape: const CircularNotchedRectangle(),
      onTabSelected: (int index) => controller.onTabSelected(index),
      activeStyle: context.textSize11.copyWith(fontWeight: FontWeight.w500),
      inActiveStyle:
      context.textSize11.copyWith(color: const Color(0xFFADADAD)),
      badgeStyle: context.textSize11.copyWith(color: Colors.white),
    );
  }


  Widget buildBody() {
    return TabBarView(
      controller: controller.tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        KeepAliveWrapper(child: HomePageView()),
        KeepAliveWrapper(child: StockMarketSellPage()),
      ],
    );
  }
}
