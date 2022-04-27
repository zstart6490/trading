import 'package:get/get.dart';
import 'package:trading_module/data/repos/stock_exchange_impl.dart';
import 'package:trading_module/data/repos/stock_market_repo_impl.dart';
import 'package:trading_module/data/repos/stock_repo_impl.dart';
import 'package:trading_module/data/services/stock_market_service.dart';
import 'package:trading_module/data/services/stock_order_service.dart';
import 'package:trading_module/data/services/stock_service.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/domain/use_cases/stock_exchange_usecase.dart';
import 'package:trading_module/domain/use_cases/stock_maket_usecase.dart';
import 'package:trading_module/domain/use_cases/stock_usecase.dart';
import 'package:trading_module/pages/stock_detail/Views/chart_view_controller.dart';
import 'package:trading_module/pages/stock_more_detail/stock_more_detail_controller.dart';

class StockMoreDetailBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is StockModel) {
      Get.lazyPut(() => ChartController(arg));
      Get.lazyPut(() => StockMoreDetailController(arg));
      Get.lazyPut(
        () => StockExchangeUseCase(
          StockExchangeRepoImpl(StockOrderServiceImpl()),
        ),
      );

      Get.lazyPut(
        () => StockMarketUseCase(
          StockMarketRepoImpl(StockMarketServiceImpl()),
        ),
      );

      if (!Get.isRegistered<StockUseCase>()) {
        Get.lazyPut<StockUseCase>(
          () => StockUseCase(
            StockRepoImpl(StockServiceImpl()),
          ),
        );
      }
    }
  }
}
