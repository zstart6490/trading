import 'package:get/get.dart';
import 'package:trading_module/pages/select_stock/select_stock_controller.dart';


class SelectStockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectStockController());
  }
}
