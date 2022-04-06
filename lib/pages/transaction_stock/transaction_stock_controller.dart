import 'package:get/get.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/data/entities/navigate_stock_trans_detail.dart';
import 'package:trading_module/routes/app_routes.dart';

class TransactionStockController extends BaseController{
  final NavigateStockTranDetail navigateStockTranDetail;

  TransactionStockController(this.navigateStockTranDetail);

  @override
  void onInit() {
    super.onInit();
  }

  void onSelectBackHome() {
    Get.until((route)=>Get.currentRoute== AppRoutes.mainView);
  }
}