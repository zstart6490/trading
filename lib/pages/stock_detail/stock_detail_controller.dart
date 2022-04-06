import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/routes/app_routes.dart';


class StockDetailController extends  BaseController
with GetSingleTickerProviderStateMixin{

  final StockModel stock;
  StockDetailController(this.stock);

  final timeRange = ["Tổng quan".tr, "Tài chính".tr, "Tin tức".tr];
  late TabController tabController;

  final int countItem = 12;

  @override
  void onInit() {
    tabController = TabController(length: timeRange.length, vsync: this);
    tabController.addListener(() {});
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void selTab(int index) {
    tabController.animateTo(index);
  }

  void onTapped() {
    Get.toNamed(AppRoutes.stockMoreDetail, arguments: stock);
  }
}


