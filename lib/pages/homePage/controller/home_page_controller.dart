import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/navigate_withdraw_data.dart';
import 'package:trading_module/domain/use_cases/open_withdraw_usecase.dart';
import 'package:trading_module/routes/app_routes.dart';

class HomePageController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final timeRange = ["Đang đầu tư".tr, "Đang theo dõi".tr, "Lệnh đã đặt".tr];
  late TabController tabController;
  final OpenWithdrawUseCase _withdrawUseCase = Get.find<OpenWithdrawUseCase>();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: timeRange.length, vsync: this);
    tabController.addListener(() {});
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
}
