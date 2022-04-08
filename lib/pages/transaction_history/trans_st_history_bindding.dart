import 'package:get/get.dart';
import 'package:trading_module/data/repos/stock_order_history_impl.dart';
import 'package:trading_module/data/services/stock_order_service.dart';
import 'package:trading_module/domain/use_cases/history_order_usecase.dart';
import 'package:trading_module/pages/transaction_history/trans_st_history_item_controller.dart';

class TransStockHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StockHistoryOrderUseCase(StockOrderHistoryRepoImpl(StockOrderServiceImpl())));
    Get.lazyPut(() => TransStockHistoryController());
  }
}
