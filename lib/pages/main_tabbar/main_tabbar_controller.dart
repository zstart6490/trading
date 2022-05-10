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

    super.onInit();
  }

  @override
  void onReady() {}

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
    FocusManager.instance.primaryFocus?.unfocus();
    if (tabIndex == 0) {
    } else if (tabIndex == 1) {
    } else if (tabIndex == 2) {}
  }

  int get tabIndex => tabController.index;

  set tabIndex(int value) {
    tabController.index = value;
  }
}
