import 'package:get/get.dart';
import 'package:trading_module/cores/stock_price_socket.dart';
import 'package:trading_module/pages/exchange/select_stock/select_stock_controller.dart';


class SelectStockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StockPriceSocket());
    Get.lazyPut(() => SelectStockController());
  }
}
