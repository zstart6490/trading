import 'package:get/get.dart';
import 'package:trading_module/data/repos/withdraw_repos_impl.dart';
import 'package:trading_module/data/services/withdraw_service.dart';
import 'package:trading_module/domain/entities/navigate_withdraw_data.dart';
import 'package:trading_module/domain/use_cases/withdraw_usecase.dart';
import 'package:trading_module/pages/withdraw/withdraw_controller.dart';


class WithdrawBinding extends Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;

    if (arg is NavigateWithdrawData) {
      Get.lazyPut(() =>  WithdrawUseCase(WithdrawRepoImpl(WithdrawServiceImpl())));
      Get.lazyPut(() => WithdrawController(arg));
    }
  }
}
