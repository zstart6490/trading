import 'package:get/get.dart';
import 'package:trading_project/data/repos/repos_impl.dart';
import 'package:trading_project/data/services/order_service.dart';
import 'package:trading_project/domain/repos/repos.dart';
import 'package:trading_project/domain/use_cases/user_case.dart';
import 'package:trading_project/pages/home/controllers/home_controller.dart';


class HomeBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ModelRepo>(() => ModelRepoImpl(OrderServiceImpl("token")));
    Get.lazyPut<ModelUseCase>(() => ModelUseCase(Get.find()));
    Get.lazyPut(() => HomeController());
  }
}
