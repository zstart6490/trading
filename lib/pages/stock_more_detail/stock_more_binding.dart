import 'package:get/get.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/pages/stock_more_detail/stock_more_detail_controller.dart';

class StockMoreDetailBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is StockModel) {
      Get.lazyPut(() => StockMoreDetailController(arg));
    }
  }
}
