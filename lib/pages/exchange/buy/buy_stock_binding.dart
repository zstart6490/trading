import 'package:get/get.dart';
import 'package:trading_module/data/repos/stock_exchange_impl.dart';
import 'package:trading_module/data/services/stock_order_service.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/stock_exchange_usecase.dart';
import 'package:trading_module/pages/exchange/buy/buy_stock_controller.dart';

class BuyStockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StockExchangeUseCase(
        StockExchangeRepoImpl(StockOrderServiceImpl())));
    // Get.lazyPut(() => StockPriceSocket());
    if (Get.arguments is StockModel) {
      final StockModel stockModel = Get.arguments as StockModel;
      Get.lazyPut(() => BuyStockController(stockModel));
    }
  }
}
