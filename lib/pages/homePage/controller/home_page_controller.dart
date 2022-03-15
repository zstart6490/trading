import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/data/entities/naptien/SavingProduct.dart';
import 'package:trading_module/routes/app_routes.dart';



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

  void gotoSaving() {
    final product = SavingProduct();
    Get.toNamed(AppRoutes.tdInputMoneyLocal, arguments: product);
  }
}
