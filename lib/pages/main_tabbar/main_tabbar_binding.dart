import 'package:get/instance_manager.dart';
import 'package:trading_module/data/repos/stock_repo_impl.dart';
import 'package:trading_module/data/repos/withdraw_repos_impl.dart';
import 'package:trading_module/data/services/local/stock_storage_service.dart';
import 'package:trading_module/data/services/stock_service.dart';
import 'package:trading_module/data/services/withdraw_service.dart';
import 'package:trading_module/domain/use_cases/open_withdraw_usecase.dart';
import 'package:trading_module/domain/use_cases/stock_usecase.dart';
import 'package:trading_module/pages/homePage/controller/home_page_controller.dart';
import 'package:trading_module/pages/main_tabbar/main_tabbar_controller.dart';
import 'package:trading_module/pages/market/market_controller.dart';


class MainTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TDMainTabController());
    Get.lazyPut(() => HomePageController());

    Get.lazyPut(() => MarketController());
    Get.lazyPut(() => OpenWithdrawUseCase(WithdrawRepoImpl(WithdrawServiceImpl())));
    if (!Get.isRegistered<StockUseCase>()) {
      Get.lazyPut(() =>StockUseCase(StockRepoImpl(StockServiceImpl(),StockStorageServiceImpl())));
    }
  }
}