import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/data/entities/navigate_trans_detail.dart';
import 'package:trading_module/data/entities/transaction.dart';
import 'package:trading_module/pages/homePage/controller/home_page_controller.dart';

class TransactionDetailController extends BaseController {
  NavigateTranDetail mData;

  TransactionDetailController(this.mData);

  int pushCount = 0;

  @override
  void onInit() {

    super.onInit();
  }

  @override
  void onReady() {

    super.onReady();
  }
  @override
  Future<bool> onWillPop() {
    if (mData.hasBtn) {
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  void onReloadData(Transaction newTransaction) {
    // mData.transaction = newTransaction;
    // mData.hasBtn = true;
    // update();
  }

  String getTitle() {
    return "Chi tiết giao dịch";
  }

  void goToHomeTrading() {
    // if (Get.isRegistered<HomePageController>()) {
    //   final HomePageController homeController =
    //   Get.find<HomePageController>();
    //   homeController.getAccountInfo();
    // }
    Get.back();
  }
}
