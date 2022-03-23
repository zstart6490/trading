import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/data/entities/naptien/SavingProduct.dart';
import 'package:trading_module/domain/use_cases/home_trading_usecase.dart';
import 'package:trading_module/routes/app_routes.dart';



class HomePageController extends BaseController  with GetSingleTickerProviderStateMixin {
  final timeRange = ["Đang đầu tư".tr, "Đang theo dõi".tr, "Lệnh đã đặt".tr];
  late TabController tabController;

  late RefreshController refreshController;

  final HomeTradingUseCase _homeTradingUseCase = Get.find();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: timeRange.length, vsync: this);
    tabController.addListener(() {

    });
    refreshController = RefreshController();
  }

  void selTab(int index) {
    tabController.animateTo(index);
  }

  void gotoSaving() {
    final product = SavingProduct();
    Get.toNamed(AppRoutes.tdInputMoneyLocal, arguments: product);
  }

  void onRefresh() {
    Future.wait([
      getAccountInfo(),
    ]).then((_) => refreshController.refreshCompleted());
    //refreshListTransaction();
  }

  Future<void> getAccountInfo() async {
    showProgressingDialog();
    final result = await _homeTradingUseCase.getAccountInfo();
    hideDialog();
    if (result.data != null) {
      // transaction = result.data!;
      // change(result.data, status: RxStatus.success());
    } else if (result.error != null) {
      showSnackBar(result.error!.message);
    }
  }
}
