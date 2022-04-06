import 'package:get/get.dart';
import 'package:trading_module/data/entities/navigate_stock_trans_detail.dart';
import 'package:trading_module/pages/transaction_stock/transaction_stock_controller.dart';

class TransactionStockDetailBinding extends Bindings {
  @override
  void dependencies() {
    if (Get.arguments is NavigateStockTranDetail) {
      final detail = Get.arguments as NavigateStockTranDetail;
      Get.lazyPut(() => TransactionStockController(detail));
    }
  }
}
