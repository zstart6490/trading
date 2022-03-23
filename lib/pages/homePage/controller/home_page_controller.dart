import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/data/entities/naptien/SavingProduct.dart';
import 'package:trading_module/domain/entities/navigate_withdraw_data.dart';
import 'package:trading_module/domain/use_cases/home_trading_usecase.dart';
import 'package:trading_module/pages/homePage/views/PropertyView/property_controller.dart';
import 'package:trading_module/domain/use_cases/open_withdraw_usecase.dart';
import 'package:trading_module/routes/app_routes.dart';

class HomePageController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final timeRange = ["Đang đầu tư".tr, "Đang theo dõi".tr];
  late TabController tabController;
  final OpenWithdrawUseCase _withdrawUseCase = Get.find<OpenWithdrawUseCase>();
  final HomeTradingUseCase _homeTradingUseCase = Get.find<HomeTradingUseCase>();
  late RefreshController refreshController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: timeRange.length, vsync: this);
    tabController.addListener(() {});
    refreshController = RefreshController();
  }

  Future openCashOut() async {
    final bool userHasAddBank = dataAppParent.hasAddBank ?? false;
    if (userHasAddBank) {
      showProgressingDialog();
      final result = await _withdrawUseCase.listReason();
      hideDialog();
      if (result.data != null) {
        Get.toNamed(AppRoutes.withdrawReasonScene,
            arguments: NavigateWithdrawData(
                listReason: result.data!, listUserBank: [], totalMoneyUser: 5000000));
      }
      if (result.error != null) {
        showSnackBar(result.error!.message);
      }
    } else {
      //to add bank
      mainProvider.callToAddBank?.call(
        () {
          dataAppParent.hasAddBank =true;
          openCashOut();
        },
      );
    }
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
      Get.find<HomePropertyController>().getAccountInfo(),
    ]).then((_) => refreshController.refreshCompleted());
    //refreshListTransaction();
  }

}
