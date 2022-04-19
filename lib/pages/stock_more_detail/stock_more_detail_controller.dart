import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/stock_current_price_model.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/stock_exchange_usecase.dart';
import 'package:trading_module/domain/use_cases/stock_usecase.dart';
import 'package:trading_module/pages/stock_more_detail/overlayView/overlay_balance.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/CustomOverlay.dart';


class StockMoreDetailController extends  BaseController
    with StateMixin<StockCurrentPriceModel>, GetSingleTickerProviderStateMixin{

  final StockModel stock;
  StockMoreDetailController(this.stock);

  final StockUseCase _stockUseCase = Get.find<StockUseCase>();
  final StockExchangeUseCase _stockExchangeUseCase = Get.find<StockExchangeUseCase>();


  final timeRange = ["Tổng quan".tr, "Tài chính".tr, "Tin tức".tr];
  late TabController tabController;
  late Offset totalAmountOffset;
  late GlobalKey followKey;


  RxBool isFollow = false.obs;

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
    getCurrentStockPrice();
    checkShowGuidePopup();
    super.onReady();
  }


  Future<void> getCurrentStockPrice() async {
    final result = await _stockUseCase.getCurrentStockPrice(symbol: stock.symbol);
    if (result.data != null) {
      isFollow.value = result.data?.isProductWatching ?? false;
      change(result.data, status: RxStatus.success());
    } else if (result.error != null) {
      change(null, status: RxStatus.error());
      showSnackBar(result.error!.message);
    }
  }

  void onPressUnderstoodGuide() {
    final box = GetStorage();
    box.write(APP_FOLLOW_STOCK_OPENED, true);
    Get.back();
  }

  Future<void> checkShowGuidePopup() async {
    if (shouldShowOnBoarding()) {
      showOnBoarding();
    }
  }

  void showOnBoarding() {
    DUR_400.delay().then((_) => getPositionWidget());
  }

  void showGuide() {
    Navigator.of(Get.context!).push(
      CustomOverlay(
        child: InkWell(
          onTap: onPressUnderstoodGuide,
          child: OverlayBalance(
            totalAmountOffset: totalAmountOffset,
          ),
        ),
      ),
    );
  }

  bool shouldShowOnBoarding() {
    final box = GetStorage();
    return !(box.read<bool>(APP_FOLLOW_STOCK_OPENED) ?? false);
  }

  void getPositionWidget() {
    totalAmountOffset = getOffsetWidget(followKey);
    showGuide();
  }

  Offset getOffsetWidget(GlobalKey globalKey) {
    final RenderBox? renderBox =
    globalKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;
  }

  void onTabChange(int index) {
    debugPrint("TabChange :${tabController.index}");
    if (tabController.index == 0) {

    } else if (tabController.index == 1) {

    } else if (tabController.index == 2) {

    }
  }

  void selTab(int index) {
    tabController.animateTo(index);
  }

  void buyTapped() {
    Get.toNamed(AppRoutes.buyStock, arguments: stock);
  }

  void sellTapped() {
    Get.toNamed(AppRoutes.sellStock, arguments: stock);
  }

  Future<void> follow() async{
    final isFlow =  !isFollow.value;
    final result = await _stockExchangeUseCase.addFollowing(stock: stock.symbol, type: "0", isFlow: isFlow);
    if (result.data != null){
      isFollow.value =  isFlow;
    }
  }
}
