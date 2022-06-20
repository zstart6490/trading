import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/cores/stock_price_socket.dart';
import 'package:trading_module/data/repos/home_trading_repo_imp.dart';
import 'package:trading_module/data/services/home_trading_service.dart';
import 'package:trading_module/data/services/local/LocalStorageServices.dart';
import 'package:trading_module/domain/entities/account_info_model.dart';
import 'package:trading_module/domain/entities/navigate_withdraw_data.dart';
import 'package:trading_module/domain/entities/property_model.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/home_trading_usecase.dart';
import 'package:trading_module/domain/use_cases/open_withdraw_usecase.dart';
import 'package:trading_module/pages/main_tabbar/main_tabbar_controller.dart';
import 'package:trading_module/routes/app_navigate.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';
import 'package:trading_module/utils/extensions.dart';

enum SortEnum { normal, up, down }

class HomePageController extends BaseController
    with StateMixin<AccountInfoModel>, GetSingleTickerProviderStateMixin {
  final timeRange = ["Đang đầu tư".tr, "Đang theo dõi".tr];
  late TabController tabController;
  final OpenWithdrawUseCase _withdrawUseCase = Get.find<OpenWithdrawUseCase>();
  final HomeTradingUseCase _homeTradingUseCase = HomeTradingUseCase(HomeTradingRepoImpl(HomeTradingServiceImpl(),LocalStorageServiceImpl()));


  List<StockModel> listStock = <StockModel>[];
  final StockPriceSocket stockPriceSocket = Get.find<StockPriceSocket>();

  RefreshController refreshController = RefreshController();

  Rx<SortEnum> sortAlphabet = Rx<SortEnum>(SortEnum.normal);
  Rx<SortEnum> sortVolume = Rx<SortEnum>(SortEnum.normal);
  Rx<SortEnum> sortCurrentPrice = Rx<SortEnum>(SortEnum.normal);
  Rx<SortEnum> sortProfitAndLoss = Rx<SortEnum>(SortEnum.normal);

  late bool isSubscribeFollow = false;
  late bool isSubscribeInvest = false;

  AccountInfoModel? accountInfoModel;

  @override
  void onInit() {
    tabController = TabController(length: timeRange.length, vsync: this);
    tabController.addListener(() {
      if (!tabController.indexIsChanging) onTabChange(tabController.index);
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadCache();
    getAccountInfo();
  }

  @override
  void onClose() {
    isSubscribeFollow = false;
    isSubscribeInvest = false;
    stockPriceSocket.unSubscribeStock();
  }

  @override
  Future<bool> onWillPop() {
    stockPriceSocket.unSubscribeStock();
    return Future.value(true);
  }

  Future openCashOut() async {
    final double balance = accountInfoModel?.cashBalance ?? 0;
    if (balance <= 0) {
      final subtitleStyle = Get.context!.textSize14;
      showAlertDialog(CustomAlertDialog(
          title: "Thông báo",
          descWidget: RichText(
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
          ),
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
    change(accountInfoModel, status: RxStatus.success());
    subscribe();
  }

  void stockDetail(PropertyModel? stock) {
    if (tabController.index == 0) {
      Get.toNamed(AppRoutes.stockDetail, arguments: stock?.toStockModel());
    } else if (tabController.index == 1) {
      Get.toNamed(AppRoutes.stockMoreDetail, arguments: stock?.toStockModel());
    }
  }

  void selectStock() {
    navToSelectStock();
  }

  void selectMarketStock() {
    final TDMainTabController tdMainTabController = Get.find();
    tdMainTabController.tabIndex = 1;
  }

  void selTab(int index) {
    tabController.animateTo(index);
  }

  void gotoSaving() {
    Get.toNamed(AppRoutes.tdInputMoneyLocal);
  }

  Future onRefresh() {
    return Future.wait([
      getAccountInfo(),
    ]).then((_) => refreshController.refreshCompleted());
  }

  void subscribe() {
    if (isSubscribeInvest && isSubscribeFollow) return;
    final List<String> symbols;
    if (tabController.index == 0) {
      symbols = accountInfoModel?.stockList
              ?.where((e) => e.productKey != null)
              .map((e) => e.productKey!)
              .toList() ??
          [""];
      isSubscribeInvest = true;
    } else {
      symbols = accountInfoModel?.productWatchingVOList
              ?.where((e) => e.productKey != null)
              .map((e) => e.productKey!)
              .toList() ??
          [""];
      isSubscribeFollow = true;
      //register topic notify
      if (mainProvider.box.hasData(TopicsNotifySubscribe)) {
        final dynamic cache =
            mainProvider.box.read<dynamic>(TopicsNotifySubscribe);
        if (cache is String && cache.isNotEmpty) {
          final List<dynamic> topicCache = jsonDecode(cache) as List<dynamic>;
          final List<String> newSymbols = [];
          for (final dynamic topicNew in topicCache) {
            if (!symbols.contains(topicNew as String)) {
              newSymbols.add(topicNew);
            }
          }
          topicCache.removeWhere((element) => symbols.contains(element));
          final List<String> unsubscribeTopic = [];
          for (dynamic t in topicCache) {
            unsubscribeTopic.add(t as String);
          }
          mainProvider.registerNotifyTopic?.call(newSymbols, unsubscribeTopic);
          mainProvider.box.write(TopicsNotifySubscribe, jsonEncode(symbols));
        } else {
          mainProvider.box.remove(TopicsNotifySubscribe);
        }
      } else {
        if (symbols.isNotEmpty) {
          mainProvider.box.write(TopicsNotifySubscribe, jsonEncode(symbols));
        }
      }
      //
    }

    stockPriceSocket.subscribeStock(
      symbols,
      (stock) {
        //print("stock.stockPrice.symbol: ${stock.stockPrice.symbol}");
        accountInfoModel?.stockList
            ?.firstWhereOrNull((e) => e.productKey == stock.stockPrice.symbol)?.lastPrice = stock.stockPrice.price;
        accountInfoModel?.productWatchingVOList
            ?.firstWhereOrNull((e) => e.productKey == stock.stockPrice.symbol)?.lastPrice = stock.stockPrice.price;
        change(accountInfoModel, status: RxStatus.success());
      },
    );
  }

  Future<void> getAccountInfo() async {
    final result = await _homeTradingUseCase.getAccountInfo();
    if (result.data != null) {
      accountInfoModel = result.data;
      //Add item fake Header section view1
      accountInfoModel?.stockList?.insert(0,
          PropertyModel(null, null, null, null, null, null, null, null, null));
      accountInfoModel?.productWatchingVOList?.insert(0,
          PropertyModel(null, null, null, null, null, null, null, null, null));
      change(accountInfoModel, status: RxStatus.success());
      subscribe();

    } else if (result.error != null) {
      if (accountInfoModel == null){
        change(null, status: RxStatus.error(result.error!.message));
      }else{
        showSnackBar(result.error!.message);
      }
    } else {
      //change(null, status: RxStatus.empty());
    }
  }


  void loadCache() {
    final result = _homeTradingUseCase.getCache();
    if (result.data != null) {
      accountInfoModel = result.data;
      //Add item fake Header section view1
      accountInfoModel?.stockList?.insert(0,
          PropertyModel(null, null, null, null, null, null, null, null, null));
      accountInfoModel?.productWatchingVOList?.insert(0,
          PropertyModel(null, null, null, null, null, null, null, null, null));
      change(accountInfoModel, status: RxStatus.success());
    } else {
      //change(null, status: RxStatus.empty());
    }
  }

  void openBuyStock() {
    navToSelectStock();
  }

  void openSellStock() {
    navToProductOwner();
  }

  void tapOnSortAlphabet() {
    sortCurrentPrice.value = SortEnum.normal;
    sortProfitAndLoss.value = SortEnum.normal;
    sortVolume.value = SortEnum.normal;

    if (sortAlphabet.value != SortEnum.down) {
      sortAlphabet.value = SortEnum.down;
    } else {
      sortAlphabet.value = SortEnum.up;
    }

    if (tabController.index == 0) {
      //Remove item fake Header section view
      accountInfoModel?.stockList?.removeAt(0);
      if (sortAlphabet.value == SortEnum.down) {
        accountInfoModel?.stockList
            ?.sort((a, b) => b.productKey!.compareTo(a.productKey!));
      } else {
        accountInfoModel?.stockList
            ?.sort((a, b) => a.productKey!.compareTo(b.productKey!));
      }
      accountInfoModel?.stockList?.insert(0,
          PropertyModel(null, null, null, null, null, null, null, null, null));
    } else if (tabController.index == 1) {
      accountInfoModel?.productWatchingVOList?.removeAt(0);
      if (sortAlphabet.value == SortEnum.down) {
        accountInfoModel!.productWatchingVOList!
            .sort((a, b) => b.productKey!.compareTo(a.productKey!));
      } else {
        accountInfoModel!.productWatchingVOList!
            .sort((a, b) => a.productKey!.compareTo(b.productKey!));
      }
      accountInfoModel?.productWatchingVOList?.insert(0,
          PropertyModel(null, null, null, null, null, null, null, null, null));
    }
    change(accountInfoModel, status: RxStatus.success());
  }

  void tapOnSortVolume() {
    sortCurrentPrice.value = SortEnum.normal;
    sortProfitAndLoss.value = SortEnum.normal;
    sortAlphabet.value = SortEnum.normal;

    if (sortVolume.value != SortEnum.down) {
      sortVolume.value = SortEnum.down;
    } else {
      sortVolume.value = SortEnum.up;
    }
    if (tabController.index == 0) {
      accountInfoModel?.stockList?.removeAt(0);
      if (sortVolume.value == SortEnum.down) {
        accountInfoModel?.stockList
            ?.sort((a, b) => b.quantity!.compareTo(a.quantity!));
      } else {
        accountInfoModel?.stockList
            ?.sort((a, b) => a.quantity!.compareTo(b.quantity!));
      }
      accountInfoModel?.stockList?.insert(0,
          PropertyModel(null, null, null, null, null, null, null, null, null));
    }
    change(accountInfoModel, status: RxStatus.success());
  }

  void tapOnSortCurrentPrice() {
    sortAlphabet.value = SortEnum.normal;
    sortProfitAndLoss.value = SortEnum.normal;
    sortVolume.value = SortEnum.normal;

    if (sortCurrentPrice.value != SortEnum.down) {
      sortCurrentPrice.value = SortEnum.down;
    } else {
      sortCurrentPrice.value = SortEnum.up;
    }

    if (tabController.index == 0) {
      accountInfoModel?.stockList?.removeAt(0);
      if (sortCurrentPrice.value == SortEnum.down) {
        accountInfoModel?.stockList
            ?.sort((a, b) => b.priceAvg!.compareTo(a.priceAvg!));
      } else {
        accountInfoModel?.stockList
            ?.sort((a, b) => a.priceAvg!.compareTo(b.priceAvg!));
      }
      accountInfoModel?.stockList?.insert(0,
          PropertyModel(null, null, null, null, null, null, null, null, null));
    } else if (tabController.index == 1) {
      accountInfoModel?.productWatchingVOList?.removeAt(0);
      if (sortCurrentPrice.value == SortEnum.down) {
        accountInfoModel!.productWatchingVOList!
            .sort((a, b) => b.lastPrice!.compareTo(a.lastPrice!));
      } else {
        accountInfoModel!.productWatchingVOList!
            .sort((a, b) => a.lastPrice!.compareTo(b.lastPrice!));
      }
      accountInfoModel?.productWatchingVOList?.insert(0,
          PropertyModel(null, null, null, null, null, null, null, null, null));
    }
    change(accountInfoModel, status: RxStatus.success());
  }

  void tapOnSortProfitAndLoss() {
    sortAlphabet.value = SortEnum.normal;
    sortCurrentPrice.value = SortEnum.normal;
    sortVolume.value = SortEnum.normal;

    if (sortProfitAndLoss.value != SortEnum.down) {
      sortProfitAndLoss.value = SortEnum.down;
    } else {
      sortProfitAndLoss.value = SortEnum.up;
    }
    if (tabController.index == 0) {
      accountInfoModel?.stockList?.removeAt(0);
      if (sortProfitAndLoss.value == SortEnum.down) {
        accountInfoModel?.stockList?.sort((a, b) => b
            .getNumberPriceDifference()
            .compareTo(a.getNumberPriceDifference()));
      } else {
        accountInfoModel?.stockList?.sort((a, b) => a
            .getNumberPriceDifference()
            .compareTo(b.getNumberPriceDifference()));
      }
      accountInfoModel?.stockList?.insert(0,
          PropertyModel(null, null, null, null, null, null, null, null, null));
    } else if (tabController.index == 1) {
      accountInfoModel?.productWatchingVOList?.removeAt(0);
      if (sortProfitAndLoss.value == SortEnum.down) {
        accountInfoModel!.productWatchingVOList!.sort((a, b) => b
            .getNumberPercentageFollow()
            .compareTo(a.getNumberPercentageFollow()));
      } else {
        accountInfoModel!.productWatchingVOList!.sort((a, b) => a
            .getNumberPercentageFollow()
            .compareTo(b.getNumberPercentageFollow()));
      }
      accountInfoModel?.productWatchingVOList?.insert(0,
          PropertyModel(null, null, null, null, null, null, null, null, null));
    }
    change(accountInfoModel, status: RxStatus.success());
  }
}
