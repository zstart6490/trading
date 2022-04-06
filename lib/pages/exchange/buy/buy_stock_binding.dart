import 'package:get/get.dart';
import 'package:trading_module/cores/socket_stock.dart';
import 'package:trading_module/data/repos/stock_exchange_impl.dart';
import 'package:trading_module/data/services/stock_exchange_service.dart';
import 'package:trading_module/domain/use_cases/stock_exchange_usecase.dart';
import 'package:trading_module/pages/exchange/buy/buy_stock_controller.dart';

class BuyStockBinding extends Bindings {
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
      Get.lazyPut(() => BuyStockController(symbol,symbolDesc, price));
    }
  }
}
