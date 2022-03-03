import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/resources/data_state.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/use_cases/user_case.dart';

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
