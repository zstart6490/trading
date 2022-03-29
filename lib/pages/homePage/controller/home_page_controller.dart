import 'package:flutter/material.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/data/entities/naptien/SavingProduct.dart';
import 'package:trading_module/domain/entities/navigate_withdraw_data.dart';
import 'package:trading_module/domain/use_cases/home_trading_usecase.dart';
import 'package:trading_module/domain/use_cases/open_withdraw_usecase.dart';
import 'package:trading_module/domain/use_cases/stock_use_case.dart';
import 'package:trading_module/pages/homePage/views/PropertyView/property_controller.dart';
import 'package:trading_module/routes/app_routes.dart';
import 'package:trading_module/shared_widgets/CustomAlertDialog.dart';
import 'package:trading_module/utils/extensions.dart';

class HomePageController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final timeRange = ["Đang đầu tư".tr, "Đang theo dõi".tr];
  late TabController tabController;
  final OpenWithdrawUseCase _withdrawUseCase = Get.find<OpenWithdrawUseCase>();
  final HomeTradingUseCase _homeTradingUseCase = Get.find<HomeTradingUseCase>();
  final StockUseCase _stockUseCase = Get.find<StockUseCase>();
  late RefreshController refreshController;

  late Stream myStream;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: timeRange.length, vsync: this);
    tabController.addListener(() {});
    refreshController = RefreshController();
    getListStock();
    subscribe();
  }

  Future openCashOut() async {
    if (Get.isRegistered<HomePropertyController>()) {
      final HomePropertyController homePropertyController =
          Get.find<HomePropertyController>();
      if (homePropertyController.accountInfoModel == null) {
        return;
      }
      final double balance =
          homePropertyController.accountInfoModel?.cashBalance ?? 0;
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

  void getListStock() async{
    //final stock = await  _stockUseCase.subscribe(["AAA","AAT","ABS"]);
  }



  void subscribe() {
    print("Start subscribe");
    SSEClient.subscribeToSSE(
        url:
        'http://104.199.179.48:8910/stock/v1/subscribe/AAA-AAT-ABS',
        header: {
          "Cookie":
          'jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3QiLCJpYXQiOjE2NDMyMTAyMzEsImV4cCI6MTY0MzgxNTAzMX0.U0aCAM2fKE1OVnGFbgAU_UVBvNwOMMquvPY8QaLD138; Path=/; Expires=Wed, 02 Feb 2022 15:17:11 GMT; HttpOnly; SameSite=Strict',
          "Accept": "text/event-stream",
          "Cache-Control": "no-cache",
        }).listen((event) {
      print('Id: ' + event.id!);
      print('Event: ' + event.event!);
      print('Data: ' + event.data!);
    });
  }


}
