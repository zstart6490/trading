import 'package:get/get.dart';
import 'package:trading_module/data/repos/home_trading_repo_imp.dart';
import 'package:trading_module/data/services/home_trading_service.dart';
import 'package:trading_module/domain/repos/home_trading_repo.dart';
import 'package:trading_module/domain/use_cases/home_trading_usecase.dart';
import 'package:trading_module/pages/homePage/controller/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeTradingRepo>(() => HomeTradingRepoImpl(HomeTradingServiceImpl()));
    Get.lazyPut(() => HomePropertyController());

    Get.lazyPut<HomeTradingRepo>(() => HomeTradingRepoImpl(HomeTradingServiceImpl()));
    Get.lazyPut<HomeTradingUseCase>(() => HomeTradingUseCase(Get.find()));
    Get.lazyPut(() => HomePageController());
  }
}
