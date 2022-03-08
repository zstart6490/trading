import 'package:get/get.dart';
import 'package:trading_module/data/repos/user_repo_impl.dart';
import 'package:trading_module/data/services/user_service.dart';
import 'package:trading_module/domain/repos/user_repos.dart';
import 'package:trading_module/domain/use_cases/user_use_case.dart';
import 'package:trading_module/pages/contract/contract_controller.dart';

class ContractBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepo>(() => UserRepoImpl(UserServiceImpl()));
    Get.lazyPut<UserUseCase>(() => UserUseCase(Get.find()));
    Get.lazyPut(() => ContractController());
  }
}
