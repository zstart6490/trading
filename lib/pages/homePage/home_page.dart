import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_project/pages/home/controllers/home_controller.dart';
import 'package:trading_project/pages/homePage/views/header_view.dart';
import 'package:trading_project/pages/homePage/views/menu_option_view.dart';

import '../../configs/constants.dart';
import '../../domain/entities/model.dart';
import 'controller/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
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
      ),
    );
  }
}
