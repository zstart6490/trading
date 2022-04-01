import 'package:get/get.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/pages/buy_stock/buy_stock_controller.dart';

class BuyStockBinding extends Bindings {
  @override
  void dependencies() {
    //final stock = Get.arguments as StockModel;
    //Get.lazyPut(() => BuyStockController(stock));
    Get.lazyPut(() => BuyStockController());
  }
}
