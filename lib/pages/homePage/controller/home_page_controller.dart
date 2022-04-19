import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/account_info_model.dart';
import 'package:trading_module/domain/entities/my_stock_model.dart';
import 'package:trading_module/domain/entities/navigate_withdraw_data.dart';
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

  final int countItem = 4;

  RxBool sortAlphabet = false.obs;
  RxBool sortVolume = false.obs;
  RxBool sortCurrentPrice = false.obs;
  RxBool sortProfitAndLoss = false.obs;

  AccountInfoModel? accountInfoModel;

  @override
  void onInit() {
    tabController = TabController(length: timeRange.length, vsync: this);
    tabController.addListener(() {});
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

  void stockDetail() {
    //Get.toNamed(AppRoutes.stockMoreDetail, arguments: stock);
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
      accountInfoModel?.stockList?.insert(0, MyStockModel(priceAvg: 0, quantity:0,quantityWaitingReturn:0,dividendsWaitingReturn:0));
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
    print("softAlphabet");
  }

  void tapOnSortVolume() {
    sortVolume.value = !sortVolume.value;
    print("softVolume");
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
