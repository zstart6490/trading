import 'package:get/get.dart';
import 'package:trading_module/data/repos/stock_repo_impl.dart';
import 'package:trading_module/data/services/stock_service.dart';
import 'package:trading_module/domain/use_cases/stock_usecase.dart';

class MarketBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<StockUseCase>()) {
      Get.lazyPut<StockUseCase>(
          () => StockUseCase(
                StockRepoImpl(
                  StockServiceImpl(),
                ),
              ),
          fenix: true);
    }
  }
}
