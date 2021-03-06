import 'package:get/get.dart';
import 'package:trading_module/cores/stock_price_socket.dart';
import 'package:trading_module/data/repos/stock_exchange_impl.dart';
import 'package:trading_module/data/services/stock_order_service.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/stock_exchange_usecase.dart';
import 'package:trading_module/pages/exchange/sell/sell_stock_controller.dart';

class SellStockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StockExchangeUseCase(
        StockExchangeRepoImpl(StockOrderServiceImpl())));
    // Get.lazyPut(() => StockPriceSocket());
    if (Get.arguments is StockModel) {
      StockModel stockModel =Get.arguments as StockModel;
      Get.lazyPut(() => SellStockController(stockModel));
    }
  }
}
