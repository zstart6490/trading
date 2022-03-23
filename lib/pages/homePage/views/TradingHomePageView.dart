import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/domain/entities/model.dart';
import 'package:trading_module/pages/homePage/controller/home_page_controller.dart';
import 'package:trading_module/pages/homePage/views/menu_option_view.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';

class TradingHomePageView extends GetView<HomePageController> {
  const TradingHomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<HomePageController>(
      showBackBtn: true,
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              if (index == 0) {
                return HeaderHomeView(
                  controller: controller,
                );
              }
              return BoardItemCell(
                item: Model(gstId: "SSI", startTime: DateTime.now()),
                onPressed: () {},
              );
            }),
      ), title: 'HOME',
    );
  }
}
