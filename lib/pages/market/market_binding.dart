import 'package:get/get.dart';
import 'package:trading_module/data/repos/stock_repo_impl.dart';
import 'package:trading_module/data/services/stock_service.dart';
import 'package:trading_module/domain/use_cases/stock_usecase.dart';
import 'package:trading_module/pages/market/market_controller.dart';

class MarketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MarketController());
    // if (!Get.isRegistered<StockUseCase>()) {
    //   print("Get.isRegistered<StockUseCase>()");
    //   Get.lazyPut<StockUseCase>(
    //       () => StockUseCase(
    //             StockRepoImpl(
    //               StockServiceImpl(),
    //             ),
    //           ),
    //       fenix: true);
    // }else{
    //   print("No Get.isRegistered<StockUseCase>()");
    // }
  }
}
