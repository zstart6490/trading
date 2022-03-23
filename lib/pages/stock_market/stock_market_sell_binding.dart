import 'package:get/get.dart';
import 'package:trading_module/pages/stock_market/stock_market_sell_controller.dart';

class StockMarketSellBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StockMarketSellController());
  }
}
