import 'package:get/get.dart';
import 'package:trading_module/cores/socket_stock.dart';
import 'package:trading_module/data/repos/stock_exchange_impl.dart';
import 'package:trading_module/data/services/stock_exchange_service.dart';
import 'package:trading_module/domain/use_cases/stock_exchange_usecase.dart';
import 'package:trading_module/pages/exchange/sell/sell_stock_controller.dart';

class SellStockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StockExchangeUseCase(
        StockExchangeRepoImpl(StockExchangeServiceImpl())));
    Get.lazyPut(() => StockPriceSocket());
    if (Get.arguments is List) {
      final List<dynamic> listArg = Get.arguments as List;
      final String symbol = listArg[0] as String;
      final String symbolDesc = listArg[1] as String;
      final double price = listArg[2] as double;
      Get.lazyPut(() => SellStockController(symbol,symbolDesc, price));
    }
  }
}
