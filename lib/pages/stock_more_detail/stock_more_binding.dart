import 'package:get/get.dart';
import 'package:trading_module/data/repos/stock_exchange_impl.dart';
import 'package:trading_module/data/services/stock_exchange_service.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/stock_exchange_usecase.dart';
import 'package:trading_module/pages/stock_detail/Views/chart_view_controller.dart';
import 'package:trading_module/pages/stock_more_detail/stock_more_detail_controller.dart';

class StockMoreDetailBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is StockModel) {
      Get.lazyPut(() => ChartController(arg));
      Get.lazyPut(() => StockMoreDetailController(arg));
      Get.lazyPut(() => StockExchangeUseCase(
          StockExchangeRepoImpl(StockExchangeServiceImpl())));
    }
  }
}
