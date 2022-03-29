import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';

class TDMainTabController extends BaseController
    with WidgetsBindingObserver, GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(onTabChange);

    //super.onInit();
  }

  @override
  void onReady() {

  }

  @override
  void onClose() {
    tabController.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    log("MainTabController $state", name: 'AppLifecycle');

  }

  void onTabChange() {
    debugPrint("TabChange :${tabController.index}");
    if (tabController.index == 0) {
    } else if (tabController.index == 1) {

    } else if (tabController.index == 2) {

    }
  }

  void onTabSelected(int index) {
    tabController.index = index;
  }

  void selTab(int index) {
    tabController.animateTo(index);
  }


}
