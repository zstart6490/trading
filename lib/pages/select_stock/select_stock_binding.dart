import 'package:get/get.dart';
import 'package:trading_module/cores/stock_price_socket.dart';
import 'package:trading_module/pages/select_stock/select_stock_controller.dart';
import 'package:trading_module/utils/enums.dart';


class SelectStockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StockPriceSocket());
    if(Get.arguments is StockType){
      final StockType stockType =Get.arguments as StockType;
      Get.lazyPut(() => SelectStockController(stockType));
    }
  }
}
