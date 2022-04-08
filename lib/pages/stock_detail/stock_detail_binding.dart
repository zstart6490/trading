import 'package:get/get.dart';
import 'package:trading_module/data/repos/stock_exchange_impl.dart';
import 'package:trading_module/data/services/stock_order_service.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/stock_exchange_usecase.dart';
import 'package:trading_module/pages/stock_detail/Views/chart_view_controller.dart';
import 'package:trading_module/pages/stock_detail/stock_detail_controller.dart';

class StockDetailBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is StockModel) {
      Get.lazyPut(() => StockExchangeUseCase(
          StockExchangeRepoImpl(StockOrderServiceImpl())));
      Get.lazyPut(() => ChartController(arg));
      Get.lazyPut(() => StockDetailController(arg));
    }
  }
}
