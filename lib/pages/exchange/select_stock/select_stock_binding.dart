import 'package:get/get.dart';
import 'package:trading_module/data/repos/stock_repo_impl.dart';
import 'package:trading_module/data/services/stock_service.dart';
import 'package:trading_module/domain/use_cases/stock_usecase.dart';
import 'package:trading_module/pages/exchange/select_stock/select_stock_controller.dart';


class SelectStockBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => StockPriceSocket());
    if (!Get.isRegistered<StockUseCase>()) {
      Get.lazyPut(() => StockUseCase(StockRepoImpl(StockServiceImpl())));
    }
    Get.lazyPut(() => SelectStockController());
  }
}
