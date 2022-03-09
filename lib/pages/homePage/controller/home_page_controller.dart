import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';

class HomePageController extends BaseController  with GetSingleTickerProviderStateMixin {
  final timeRange = ["Đang đầu tư".tr, "Đang theo dõi".tr, "Lệnh đã đặt".tr];
  late TabController tabController;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: timeRange.length, vsync: this);
    tabController.addListener(() {

    });
  }
}
