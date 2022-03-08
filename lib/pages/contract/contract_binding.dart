import 'package:get/get.dart';
import 'package:trading_module/data/repos/user_repo_impl.dart';
import 'package:trading_module/data/services/user_service.dart';
import 'package:trading_module/domain/repos/user_repos.dart';
import 'package:trading_module/pages/contract/contract_controller.dart';
import 'package:trading_module/pages/contract/user_use_case.dart';

class ContractBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepo>(() => UserRepoImpl(UserServiceImpl()));
    Get.lazyPut<UserUseCase>(() => UserUseCase(Get.find()));
    Get.lazyPut(() => ContractController());
  }
}
