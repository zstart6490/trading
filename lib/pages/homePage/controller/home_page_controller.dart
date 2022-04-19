import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/account_info_model.dart';
import 'package:trading_module/domain/entities/navigate_withdraw_data.dart';
import 'package:trading_module/domain/entities/property_model.dart';
import 'package:trading_module/domain/use_cases/home_trading_usecase.dart';
import 'package:trading_module/domain/use_cases/open_withdraw_usecase.dart';
import 'package:trading_module/domain/use_cases/stock_usecase.dart';
import 'package:trading_module/routes/app_navigate.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';
import 'package:trading_module/utils/extensions.dart';

class HomePageController extends BaseController
    with StateMixin<AccountInfoModel>, GetSingleTickerProviderStateMixin {
  final timeRange = ["Đang đầu tư".tr, "Đang theo dõi".tr];
  late TabController tabController;
  final OpenWithdrawUseCase _withdrawUseCase = Get.find<OpenWithdrawUseCase>();
  final HomeTradingUseCase _homeTradingUseCase = Get.find<HomeTradingUseCase>();
  final StockUseCase _stockUseCase = Get.find<StockUseCase>();
  late RefreshController refreshController;

  late Stream myStream;

  RxBool sortAlphabet = false.obs;
  RxBool sortVolume = false.obs;
  RxBool sortCurrentPrice = false.obs;
  RxBool sortProfitAndLoss = false.obs;

  AccountInfoModel? accountInfoModel;

  @override
  void onInit() {
    tabController = TabController(length: timeRange.length, vsync: this);
    tabController.addListener(() {
      if (!tabController.indexIsChanging) onTabChange(tabController.index);
    });
    refreshController = RefreshController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getAccountInfo();
  }

  Future openCashOut() async {
    if (accountInfoModel == null) {
      return;
    }
    final double balance = accountInfoModel?.cashBalance ?? 0;
    if (balance <= 0) {
      final subtitleStyle = Get.context!.textSize14;
      showAlertDialog(CustomAlertDialog(
          title: "Thông báo",
          descWidget: Expanded(
              child: RichText(
            textAlign: TextAlign.center,
            maxLines: 3,
            text: TextSpan(
              text:
                  "Số dư tiền mặt của bạn không đủ để thực hiện hành động này\n",
              style: subtitleStyle,
              children: <TextSpan>[
                TextSpan(
                    text: "(Số tiền tối thiểu là 50.000đ)",
                    style: subtitleStyle.copyWith(color: Colors.red)),
              ],
            ),
          )),
          actions: [
            AlertAction(
                text: "Đã hiểu",
                isDefaultAction: true,
                onPressed: () => hideDialog())
          ]));
      return;
    }
    final bool userHasAddBank = dataAppParent.hasAddBank ?? false;
    if (userHasAddBank) {
      showProgressingDialog();
      final result = await _withdrawUseCase.listReason();
      hideDialog();
      if (result.data != null) {
        Get.toNamed(AppRoutes.withdrawReasonScene,
            arguments: NavigateWithdrawData(
                listReason: result.data!,
                listUserBank: [],
                totalMoneyUser: balance));
      }
      if (result.error != null) {
        showSnackBar(result.error!.message);
      }
    } else {
      //to add bank
      mainProvider.callToAddBank?.call(
        () {
          dataAppParent.hasAddBank = true;
          openCashOut();
        },
      );
    }
  }

  void onTabChange(int index) {
    debugPrint("TabChange :${tabController.index}");
    change(accountInfoModel, status: RxStatus.success());
  }

  void stockDetail(PropertyModel? stock) {
    print("softAlphabet");
    Get.toNamed(AppRoutes.stockDetail, arguments: stock?.toStockModel());
  }

  void selectStock() {
    navToSelectStock();
  }

  void selTab(int index) {
    tabController.animateTo(index);
  }

  void gotoSaving() {
    Get.toNamed(AppRoutes.tdInputMoneyLocal);
  }

  void onRefresh() {
    Future.wait([
      getAccountInfo(),
    ]).then((_) => refreshController.refreshCompleted());
    //refreshListTransaction();
  }

  Future<void> getAccountInfo() async {
    final result = await _homeTradingUseCase.getAccountInfo();
    if (result.data != null) {
      accountInfoModel = result.data;
      accountInfoModel?.stockList
          ?.insert(0, PropertyModel(null, null, null, null));
      accountInfoModel?.productWatchingVOList
          ?.insert(0, PropertyModel(null, null, null, null));
      change(accountInfoModel, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.empty());
    }
  }

  void openBuyStock() {
    navToSelectStock();
  }

  void openSellStock() {
    navToProductOwner();
  }

  void tapOnSortAlphabet() {
    sortAlphabet.value = !sortAlphabet.value;
    if (tabController.index == 0) {
      accountInfoModel?.stockList?.removeAt(0);
      if (sortAlphabet.value == true) {
        accountInfoModel?.stockList
            ?.sort((a, b) => b.productKey!.compareTo(a.productKey!));
      } else {
        accountInfoModel?.stockList
            ?.sort((a, b) => a.productKey!.compareTo(b.productKey!));
      }
      accountInfoModel?.stockList
          ?.insert(0, PropertyModel(null, null, null, null));
    } else if (tabController.index == 1) {
      accountInfoModel?.productWatchingVOList?.removeAt(0);
      if (sortAlphabet.value == true) {
        accountInfoModel!.productWatchingVOList!
            .sort((a, b) => b.productKey!.compareTo(a.productKey!));
      } else {
        accountInfoModel!.productWatchingVOList!
            .sort((a, b) => a.productKey!.compareTo(b.productKey!));
      }
      accountInfoModel?.productWatchingVOList
          ?.insert(0, PropertyModel(null, null, null, null));
    }
    change(accountInfoModel, status: RxStatus.success());
  }

  void tapOnSortVolume() {
    sortVolume.value = !sortVolume.value;
    if (tabController.index == 0) {
      accountInfoModel?.stockList?.removeAt(0);
      if (sortVolume.value == true) {
        accountInfoModel?.stockList
            ?.sort((a, b) => b.priceAvg!.compareTo(a.priceAvg!));
      } else {
        accountInfoModel?.stockList
            ?.sort((a, b) => a.priceAvg!.compareTo(b.priceAvg!));
      }
      accountInfoModel?.stockList
          ?.insert(0, PropertyModel(null, null, null, null));
    } else if (tabController.index == 1) {
      accountInfoModel?.productWatchingVOList?.removeAt(0);
      if (sortVolume.value == true) {
        accountInfoModel!.productWatchingVOList!
            .sort((a, b) => b.priceAvg!.compareTo(a.priceAvg!));
      } else {
        accountInfoModel!.productWatchingVOList!
            .sort((a, b) => a.priceAvg!.compareTo(b.priceAvg!));
      }
      accountInfoModel?.productWatchingVOList
          ?.insert(0, PropertyModel(null, null, null, null));
    }
    change(accountInfoModel, status: RxStatus.success());
  }

  void tapOnSortCurrentPrice() {
    sortCurrentPrice.value = !sortCurrentPrice.value;
    print("softCurrentPrice");
  }

  void tapOnSortProfitAndLoss() {
    sortProfitAndLoss.value = !sortProfitAndLoss.value;
    print("softProfitAndLoss");
  }
}
