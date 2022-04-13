import 'package:get/get.dart';
import 'package:trading_module/cores/stock_price_socket.dart';

class MarketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StockPriceSocket());
  }
}
