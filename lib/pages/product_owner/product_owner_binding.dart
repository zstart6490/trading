import 'package:get/get.dart';
import 'package:trading_module/data/repos/stock_repo_impl.dart';
import 'package:trading_module/data/repos/user_repo_impl.dart';
import 'package:trading_module/data/services/stock_service.dart';
import 'package:trading_module/data/services/user_service.dart';
import 'package:trading_module/domain/use_cases/stock_use_case.dart';
import 'package:trading_module/domain/use_cases/user_stock_usecase.dart';
import 'package:trading_module/pages/product_owner/product_owner_controller.dart';

class ProductOwnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserStockUseCase(UserRepoImpl(UserServiceImpl())));
    Get.lazyPut(() => StockUseCase(StockRepoImpl(StockServiceImpl())));
    Get.lazyPut(() => ProductOwnerController());
  }
}
